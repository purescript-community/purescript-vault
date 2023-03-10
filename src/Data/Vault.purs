module Data.Vault
  ( Vault
  , Key
  , adjust
  , empty
  , newKey
  , insert
  , lookup
  , delete
  , union
  ) where

import Prelude

import Effect (Effect)
import Effect.Unsafe (unsafePerformEffect)
import Effect.Ref (Ref)
import Effect.Ref as Ref

import Data.Map (Map)
import Data.Map as Map
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Unique (Unique, newUnique)

-- | A persistent store for values of arbitrary types.
newtype Vault = Vault (Map Unique Item)

-- | Key for an item in vault
data Key a = Key Unique (Item' a)

type Item = Effect Unit

type Item' a = Ref (Maybe a)

-- | The empty vault
empty :: Vault
empty = Vault Map.empty

-- | Create a new key for use with a vault.
newKey :: forall a. Effect (Key a)
newKey = do
  k <- newUnique
  ref <- Ref.new Nothing
  pure $ Key k ref

-- | Insert a value for a given key. Overwrites any previous value.
insert :: forall a. Key a -> a -> Vault -> Vault
insert (Key k ref) a (Vault m) = Vault $ Map.insert k (Ref.write (Just a) ref) m

-- | Modify the value corresponding to the specified key by applying the specified function.
adjust :: forall a. (a -> a) -> Key a -> Vault -> Vault
adjust f k m = fromMaybe m $ lookup k m >>= \x -> pure $ insert k (f x) m

-- | Delete a key from the vault.
delete :: forall a. Key a -> Vault -> Vault
delete (Key k _) (Vault m) = Vault $ Map.delete k m

-- | Lookup the value of a key in the vault.
lookup :: forall a. Key a -> Vault -> Maybe a
lookup (Key k ref) (Vault m) =
  Map.lookup k m >>= \item -> unsafePerformEffect do
    item
    maybeX <- Ref.read ref
    Ref.write Nothing ref
    pure maybeX

union :: Vault -> Vault -> Vault
union (Vault m) (Vault n) = Vault $ Map.union m n
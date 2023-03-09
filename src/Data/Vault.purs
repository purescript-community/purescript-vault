module Data.Vault
  ( Vault
  , Key
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

import Data.Function.Uncurried as Fn
import Data.Maybe (Maybe(..))
import Data.Vault.Internal as V

-- | A persistent store for values of arbitrary types.
newtype Vault = Vault (V.UniqueMap Item)

-- | Key for an item in vault
data Key a = Key V.Unique (Item' a)

type Item = Effect Unit

type Item' a = Ref (Maybe a)

-- | The empty vault
empty :: Vault
empty = Vault V.empty

-- | Create a new key for use with a vault.
newKey :: forall a. Effect (Key a)
newKey = do
  k <- V.newUnique
  ref <- Ref.new Nothing
  pure $ Key k ref

-- | Insert a value for a given key. Overwrites any previous value.
insert :: forall a. Key a -> a -> Vault -> Vault
insert (Key k ref) a (Vault m) = Vault (Fn.runFn3 V.insert k (Ref.write (Just a) ref) m)

-- | Delete a key from the vault.
delete :: forall a. Key a -> Vault -> Vault
delete (Key k _) (Vault m) = Vault (Fn.runFn2 V.delete k m)

-- | Lookup the value of a key in the vault.
lookup :: forall a. Key a -> Vault -> Maybe a
lookup (Key k ref) (Vault m) = case Fn.runFn4 V.lookup Nothing Just k m of
  Nothing  -> Nothing
  Just act -> unsafePerformEffect do
    _ <- act
    Ref.modify' rollItem ref

union :: Vault -> Vault -> Vault
union (Vault m) (Vault n) = Vault (Fn.runFn2 V.union m n)

rollItem :: forall a. Maybe a -> { state :: Maybe a, value :: Maybe a }
rollItem a = { state: Nothing, value: a }

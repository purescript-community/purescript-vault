module Test.Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)

import Data.Vault as V
import Data.Maybe (Maybe(..))

itemKeyInt :: Effect (V.Key Int)
itemKeyInt = V.newKey

itemKeyString :: Effect (V.Key String)
itemKeyString = V.newKey

testCreateAndGet :: Effect Unit
testCreateAndGet = do
  k1 <- itemKeyString
  k2 <- itemKeyInt
  let m1 = V.insert k1 "vault" V.empty
      v1 = V.lookup k1 m1
      v2 = V.lookup k2 m1
  when (v1 /= Just "vault") (log "Failed getting value from Vault")
  when (v2 /= Nothing) (log "Non existing value should return Nothing")

testCreateAndDelete :: Effect Unit
testCreateAndDelete = do
  k <- itemKeyInt
  let m1 = V.insert k 1 V.empty
      v1 = V.lookup k m1
      m2 = V.delete k m1
      v2 = V.lookup k m2
  when (v1 == v2) $ log "Deleted item should return Nothing"

main :: Effect Unit
main = do
  log "Create new Vault Item"
  testCreateAndGet

  log "Crate new Vault Item and Delete"
  testCreateAndDelete

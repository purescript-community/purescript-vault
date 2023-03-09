module Test.Main where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Vault as Vault
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main =
  launchAff_ $
    runSpec [ consoleReporter ] do
      it "inserts an item" do
        let s0 = Vault.empty
        k <- liftEffect Vault.newKey
        let
          v = { foo: 1 }
          s1 = Vault.insert k v s0
        Vault.lookup k s1 `shouldEqual` pure v
      it "adjusts an item" do
        let s0 = Vault.empty
        k <- liftEffect Vault.newKey
        let
          v0 = { foo: 1 }
          s1 = Vault.insert k v0 s0
          s2 = Vault.adjust (\r -> r { foo = r.foo + 1 }) k s1
        Vault.lookup k s2 `shouldEqual` pure { foo: 2 }
      it "deletes an item" do
        let s0 = Vault.empty
        k <- liftEffect Vault.newKey
        let
          s1 = Vault.insert k 1 s0
          s2 = Vault.delete k s1
        Vault.lookup k s2 `shouldEqual` Nothing
      it "merges two vaults" do
        k <- liftEffect Vault.newKey
        l <- liftEffect Vault.newKey
        let
          a = Vault.insert k 1 Vault.empty
          b = Vault.empty # Vault.insert k 2 # Vault.insert l 3
          c = Vault.union a b
        Vault.lookup k c `shouldEqual` pure 1
        Vault.lookup l c `shouldEqual` pure 3
      describe "on insert" do
        it "does not affect other items" do
          k <- liftEffect Vault.newKey
          let
            s0 = Vault.empty
            s1 = Vault.insert k "foo" s0
          k' <- liftEffect Vault.newKey
          let s2 = Vault.insert k' 3 s1
          Vault.lookup k s2 `shouldEqual` pure "foo"
      describe "on adjust" do
        it "does not affect other items" do
          k <- liftEffect Vault.newKey
          let
            s0 = Vault.empty
            s1 = Vault.insert k "foo" s0
          k' <- liftEffect Vault.newKey
          let
            s2 = Vault.insert k' "hi" s1
            s3 = Vault.adjust (_ <> "!") k' s2
          Vault.lookup k s3 `shouldEqual` pure "foo"
      describe "on delete" do
        it "does not affect other items" do
          k <- liftEffect Vault.newKey
          let
            s0 = Vault.empty
            s1 = Vault.insert k "foo" s0
          k' <- liftEffect Vault.newKey
          let
            s2 = Vault.insert k' "hi" s1
            s3 = Vault.delete k' s2
          Vault.lookup k s3 `shouldEqual` pure "foo"
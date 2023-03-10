{ name = "vault"
, dependencies =
  [ "effect"
  , "functions"
  , "maybe"
  , "ordered-collections"
  , "prelude"
  , "refs"
  , "unique"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}

{ name = "vault"
, dependencies =
  [ "effect"
  , "maybe"
  , "ordered-collections"
  , "prelude"
  , "refs"
  , "unique"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}

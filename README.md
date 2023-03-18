# Vault

[![CI](https://github.com/rowtype-yoga/purescript-vault/workflows/CI/badge.svg?branch=master)](https://github.com/rowtype-yoga/purescript-vault/actions?query=workflow%3ACI+branch%3Amaster)
[![Release](https://img.shields.io/github/release/rowtype-yoga/purescript-vault.svg)](https://github.com/rowtype-yoga/purescript-vault/releases)
[![Pursuit](https://pursuit.purescript.org/packages/purescript-vault/badge)](https://pursuit.purescript.org/packages/purescript-vault)
[![Maintainer: nsaunders](https://img.shields.io/badge/maintainer-nsaunders-teal.svg)](https://github.com/nsaunders)

A typed, persistent store for values of arbitrary types, ported from the Haskell [Vault](https://github.com/HeinrichApfelmus/vault) library by Heinrich Apfelmus.

Think of a vault like a map that can store any value in a type-safe manner. The first step is to generate a new `Key a` value using the `newKey` function. Then, use `insert`, `lookup`, `delete`, etc., just like their [Data.Map](https://pursuit.purescript.org/packages/purescript-ordered-collections/3.0.0/docs/Data.Map) analogs.

```purescript
data Vault
data Key a

newKey :: forall a. Effect (Key a)
empty  :: Vault
insert :: forall a. Key a -> a -> Vault -> Vault
lookup :: forall a. Key a -> Vault -> Maybe a
delete :: forall a. Key a -> Vault -> Vault
adjust :: forall a. (a -> a) -> Key a -> Vault -> Vault
```

## Installation

Install `vault` with [Spago](https://github.com/purescript/spago):

```sh
spago install vault
```

If `vault` is not included in your package set, include it in `packages.dhall`, e.g.

```dhall
let upstream = -- <package set URL here>
in  upstream
  with vault =
    { dependencies =
        [ "effect"
        , "maybe"
        , "ordered-collections"
        , "prelude"
        , "refs"
        , "unique"
        ]
    , repo =
        "https://github.com/rowtype-yoga/purescript-vault.git"
    , version =
        "v1.0.0"
    }
```

## Quick start

The quick start hasn't been written yet (contributions are welcome!). The quick start covers a common, minimal use case for the library, whereas longer examples and tutorials are kept in the [docs directory](./docs).

## Documentation

Vault documentation is stored in a few places:

1. Module documentation is [published on Pursuit](https://pursuit.purescript.org/packages/purescript-vault).
2. Written documentation is kept in the [docs directory](./docs).
3. Usage examples can be found in [the test suite](./test).

If you get stuck, there are several ways to get help:

- [Open an issue](https://github.com/rowtype-yoga/purescript-vault/issues/new?labels=bug&template=bug-report.md) if you have encountered a bug or problem.
- Ask general questions on the [PureScript Discourse](https://discourse.purescript.org) forum or the [PureScript Discord](https://discord.com/invite/sMqwYUbvz6) chat.

## Contributing

You can contribute to Vault in several ways:

1. If you encounter a problem or have a question, please [open an issue](https://github.com/rowtype-yoga/purescript-vault/issues). We'll do our best to work with you to resolve or answer it.

2. If you would like to contribute code, tests, or documentation, please [read the contributor guide](./CONTRIBUTING.md). It's a short, helpful introduction to contributing to this library, including development instructions.

3. If you have written a library, tutorial, guide, or other resource based on this package, please share it on the [PureScript Discourse](https://discourse.purescript.org)! Writing libraries and learning resources are a great way to help this library succeed.

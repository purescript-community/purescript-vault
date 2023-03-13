# Changelog

Notable changes to this project are documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

Breaking changes:

New features:

Bugfixes:

Other improvements:
- Updated the project for its new home in the Rowtype Yoga organization. ([c86a9a9](https://github.com/rowtype-yoga/purescript-vault/commit/c86a9a97840bb871e7b687f3056fedead99b925b) by @nsaunders)

## [1.0.0] - 2023-03-09

Breaking changes:
- Updated to v0.15 of the compiler, dropping support for previous versions. (#1 by @nsaunders)

New features:
- Added the `adjust` function which allows the value corresponding to a given key to be modified. (#2 by @nsaunders)

Bugfixes:
- Fixed `union` function which previously ignored the first argument. (#2 by @nsaunders)

Other improvements:
- Updated the project to the standards of the [purescript-contrib](https://github.com/purescript-contrib) organization. ([713fd52](https://github.com/rowtype-yoga/purescript-vault/commit/713fd521362c2833cea5f9ef3afb1e600164b903) by @nsaunders)
- Updated the test suite to include better coverage. (#2 by @nsaunders)
- New implementation removes FFI code. (#3 by @nsaunders)

## [0.1.0] - 2017-10-30

Initial release

Contributing
============

Welcome, and thanks for your interest in Vault. Whether you are new to PureScript or here to teach us new tricks, we're glad to have you and look forward to your contributions. Listed below are a few ways you can help.

Asking questions
----------------
If you have a question, please [open an issue](https://github.com/rowtype-yoga/purescript-vault/issues/new?labels=question) to discuss it. This might help us to find a defect; reveal an opportunity to improve the documentation or developer experience; or help someone facing a similar issue in the future.

Reporting bugs
--------------
Please [open an issue](https://github.com/rowtype-yoga/purescript-vault/issues/new?labels=bug&template=bug-report.md) to discuss any defects you find.

Enhancements
------------
Please [open an issue](https://github.com/rowtype-yoga/purescript-vault/issues/new?labels=enhancement&template=change-request.md) to discuss potential enhancements to the library. When submitting design ideas, please note that, for the most part, this library is intended as a direct port of the Haskell [vault](https://hackage.haskell.org/package/vault) package as described in [this blog post](https://apfelmus.nfshost.com/blog/2011/09/04-vault.html).

Improving documentation
-----------------------
Please share any suggestions for improving or adding to the documentation by [submitting a pull request](https://github.com/rowtype-yoga/purescript-vault/compare) or [opening an issue](https://github.com/rowtype-yoga/purescript-vault/issues/new?labels=documentation).

Sharing resources
-----------------
If you have created a tutorial, auxiliary library, interesting code example, or other resource related to Vault, please [share it with the PureScript community](https://discourse.purescript.org). Increasing awareness will bring more users (and potential contributors) to the project.

Submitting code
---------------
Pull requests are welcome, but we ask that you [open an issue](https://github.com/rowtype-yoga/purescript-vault/issues/new) to discuss your plans before making any significant investment of your valuable time.

### Development environment

You can use [Nix](https://github.com/NixOS/nix) to create a development environment with all required tooling. Simply run `nix-shell` in the root project directory, and you'll have everything you need to get started.

### Making changes

* After making any changes, run `purs-tidy format-in-place src test` to format the code.
* Unit test(s) should accompany each change.

### Preparing your submission

Please verify your changes before submitting a pull request using the following commands:
1. `purs-tidy check src test`, which ensures that modules in the `src` and `test` directories conform to the project's formatting standards; and
1. `spago -x test.dhall test`, which runs the unit tests.

### Submitting a pull request

When you are ready to [submit a pull request](https://github.com/rowtype-yoga/purescript-vault/compare), please make sure to include:
1. a brief description of the change;
1. a link to the related issue, if applicable; and
1. any design considerations you feel are important.
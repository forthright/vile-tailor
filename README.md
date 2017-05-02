# vile-tailor [![CircleCI](https://circleci.com/gh/forthright/vile-tailor.svg?style=shield&circle-token=e4883f9d8bd8c567dcbb1b726099a0da511f31cb)](https://circleci.com/gh/forthright/vile-tailor) [![Build status](https://ci.appveyor.com/api/projects/status/q2btvc28hf1kvu7k/branch/master?svg=true)](https://ci.appveyor.com/project/brentlintner/vile-tailor/branch/master) [![score-badge](https://vile.io/api/v0/projects/vile-tailor/badges/score?token=USryyHar5xQs7cBjNUdZ)](https://vile.io/~brentlintner/vile-tailor) [![security-badge](https://vile.io/api/v0/projects/vile-tailor/badges/security?token=USryyHar5xQs7cBjNUdZ)](https://vile.io/~brentlintner/vile-tailor) [![coverage-badge](https://vile.io/api/v0/projects/vile-tailor/badges/coverage?token=USryyHar5xQs7cBjNUdZ)](https://vile.io/~brentlintner/vile-tailor) [![dependency-badge](https://vile.io/api/v0/projects/vile-tailor/badges/dependency?token=USryyHar5xQs7cBjNUdZ)](https://vile.io/~brentlintner/vile-tailor)

A [vile](https://vile.io) plugin for [tailor](https://tailor.sh).

**NOTICE**

This project is not actively maintained. If you want to
help maintain the project, or if you have a better
alternative to switch to, please open an issue and ask!

## Requirements

- [nodejs](http://nodejs.org)
- [npm](http://npmjs.org)
- [swift](https://swift.org)

## Installation

Currently, you need to have `tailor` installed [manually](https://github.com/sleekbyte/tailor#installation).

Example:

    npm i -D vile vile-tailor
    brew install tailor

## Config

By default, `.tailor.yml` should be picked up without any
extra config, and that is where you currently need to have
most of your config.

You can specify a custom path as well:

```yml
tailor:
  config: some/custom_path.yml
```

You can also specify an `allow` list which is passed to `tailor`.

```yml
tailor:
  allow: [ "app", "spec" ]
```

Else, `.` is used as the directory to operate on.

## Versioning

This project ascribes to [semantic versioning](http://semver.org).

## Licensing

This project is licensed under the [MPL-2.0](LICENSE) license.

Any contributions made to this project are made under the current license.

## Contributions

Current list of [Contributors](https://github.com/forthright/vile-tailor/graphs/contributors).

Any contributions are welcome and appreciated!

All you need to do is submit a [Pull Request](https://github.com/forthright/vile-tailor/pulls).

1. Please consider tests and code quality before submitting.
2. Please try to keep commits clean, atomic and well explained (for others).

### Issues

Current issue tracker is on [GitHub](https://github.com/forthright/vile-tailor/issues).

Even if you are uncomfortable with code, an issue or question is welcome.

### Code Of Conduct

This project ascribes to [contributor-covenant.org](http://contributor-covenant.org).

By participating in this project you agree to our [Code of Conduct](CODE_OF_CONDUCT.md).

### Maintainers

- Nothing to see here...

## Architecture

This project is currently written in JavaScript. Tailor provides
a JSON CLI output that is currently used until a more ideal
IPC option is implemented.

- `bin` houses any shell based scripts
- `src` is es6+ syntax compiled with [babel](https://babeljs.io)
- `lib` generated js library

## Hacking

    cd vile-tailor
    npm install
    brew install tailor
    npm run dev
    npm test

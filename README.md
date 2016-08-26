# vile-tailor [![CircleCI](https://circleci.com/gh/forthright/vile-tailor.svg?style=svg&circle-token=e4883f9d8bd8c567dcbb1b726099a0da511f31cb)](https://circleci.com/gh/forthright/vile-tailor) [![Build status](https://ci.appveyor.com/api/projects/status/q2btvc28hf1kvu7k/branch/master?svg=true)](https://ci.appveyor.com/project/brentlintner/vile-tailor/branch/master)

[![score-badge](https://vile.io/api/v0/users/brentlintner/vile-tailor/badges/score?token=uFywUmzZfbg6UboLzn6R)](https://vile.io/~/brentlintner/vile-tailor) [![security-badge](https://vile.io/api/v0/users/brentlintner/vile-tailor/badges/security?token=uFywUmzZfbg6UboLzn6R)](https://vile.io/~/brentlintner/vile-tailor) [![coverage-badge](https://vile.io/api/v0/users/brentlintner/vile-tailor/badges/coverage?token=uFywUmzZfbg6UboLzn6R)](https://vile.io/~/brentlintner/vile-tailor) [![dependency-badge](https://vile.io/api/v0/users/brentlintner/vile-tailor/badges/dependency?token=uFywUmzZfbg6UboLzn6R)](https://vile.io/~/brentlintner/vile-tailor)

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

    npm i @forthright/vile-tailor --save-dev
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

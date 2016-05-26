# vile-tailor

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

## 0.9.0+0.9.30

- new semver format, added underlying `libsql` rust crate version for easy recognition
- migrate to Dart `native_assets`, `flutter_rust_bridge` is still used, possibility to migrate to pure ffi as well will be considered
- remove flutter dependency
- bump `libsql` crate to 0.9.30
- smaller app size (yay!)
![Demo](https://raw.githubusercontent.com/dikatok/libsql_dart/main/assets/native_assets_diff.png)


## 0.8.0

- non-functional: leaner rust side

## 0.7.0

- prebuilt binaries, enables installing without having `rustup` installed
- bump dependencies, possible resulting in sync replica speed

## 0.6.0

- Turso embedded replica v2
- bump dependencies

## 0.5.0

- supports offline-writes
- add named constructor
- example gradle stuffs
- change readYourWrites default value to false
- bump libsql crate from 0.5.0 to 0.9.4
- support loading extension

## 0.4.6

- prevent multiple client creations during hot restart

## 0.4.5

- bump flutter_rust_bridge to 2.3.0

## 0.4.4

- fix demo

## 0.4.3

- let frb handles panic
- example
- demo

## 0.4.2

- expose tx behavior

## 0.4.1

- chores

## 0.4.0

- `transaction`
- Refactoring

## 0.3.1

- Fix return object of prepared statement query
- Expose rows affected for prepared statement execute
- Docs~

## 0.3.0

- Supports `batch` and `prepare`

## 0.2.0

- Supports `query` and `execute` statement

## 0.1.0

- Updated API, allow creation of local, remote, and embedded replica client

## 0.0.3

- pubspec links

## 0.0.2

- Update readme

## 0.0.1

- Initial release
- Embedded replica support

# libsql_dart

LibSQL Dart client library to interact with LibSQL/Turso database instance.

## Supported Features

Currently, only embedded replica is supported, others will follow.

## Getting Started

- Add it to your `pubspec.yaml`.
```
  libsql_dart: 0.0.1
```
- Call `LibsqlClient.init`
```dart
  await LibsqlClient.init();
```
- Instantiate the client
```dart
  final client = LibsqlClient(
      replicaPath: path,
      syncUrl: '<TURSO_OR_LIBSQL_URL>',
      syncToken: '<TOKEN>',
      syncIntervalMilliseconds: 5000);
  await client.create();
```
- Call `sync` if necessary
```dart
  await client.sync();
```
- Read the locally replicated db using `sqflite`
```dart
  final db = await openDatabase(path, readOnly: true);
  final result = await db.rawQuery('select * from customers');
  print(result);
```

**Note** Code snippets above also use `path_provider` and `sqflite` packages. When using other sqlite libraries to read the file, you need to make sure that it is done in read only mode, because the replication process assumes exclusive write lock over the file.

# libsql_dart

LibSQL Dart client library to interact with LibSQL/Turso database instance.

## Supported Features

Currently, only embedded replica is supported, others will follow.

## Getting Started

- Add it to your `pubspec.yaml`.

```
libsql_dart: 0.1.0
```

- Instantiate the client (below example is for embedded replica)

```dart
final dir = await getApplicationCacheDirectory();
final path = '${dir.path}/local.db';
final client = LibsqlClient(path)
	..authToken = '<TOKEN>'
	..syncUrl = '<TURSO_OR_LIBSQL_URL>'
	..syncIntervalSeconds = 5;
```

- Connect

```dart
await client.connect();
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

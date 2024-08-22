# libsql_dart

LibSQL Dart client library to interact with LibSQL/Turso database instance.

## Supported Features

- Local, Remote, and Embedded replica
- Running execute and query SQL statement with named or positional params

## Getting Started

- Add it to your `pubspec.yaml`.

```
libsql_dart: 0.3.1
```

- Instantiate the client (below example is for embedded replica)

```dart
final dir = await getApplicationCacheDirectory();
final path = '${dir.path}/local.db';
final client = LibsqlClient(path)
	..authToken = '<TOKEN>'
	..syncUrl = '<TURSO_OR_LIBSQL_URL>'
	..syncIntervalSeconds = 5
	..readYourWrites = true;
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

- Run insert query

```dart
await client.query("insert into customers(name) values ('John Doe')");
```

- Run batch transaction

```dart
await client.batch("""insert into customers (name) values ('Jane Doe');
	insert into customers (name) values ('Jake Doe');""");
```

- Create prepared statement

```dart
final statement = await client
	.prepare("select * from customers where id = ?");
await statement.query(positional: [1])
```

- Query the local replica again

```dart
final resultAfterInsertion = await db.rawQuery('select * from customers');
print(resultAfterInsertion);
```

**Note** Code snippets above also use `path_provider` and `sqflite` packages. When using other sqlite libraries to read the file, you need to make sure that it is done in read only mode, because the replication process assumes exclusive write lock over the file.

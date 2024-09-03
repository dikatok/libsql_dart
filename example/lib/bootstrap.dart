import 'package:libsql_dart/libsql_dart.dart';

Future<void> bootstrapDatabase(LibsqlClient client) async {
  await client.connect();
  // await client.execute("drop table if exists tasks");
  await client.execute(
      "create table if not exists tasks (id integer primary key, title text, description text, completed integer)");
}

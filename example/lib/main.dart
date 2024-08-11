import 'package:flutter/material.dart';
import 'package:libsql_dart/libsql_dart.dart';

Future<void> main() async {
  await LibsqlClient.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: const Center(
          child: Text(""),
        ),
      ),
    );
  }
}

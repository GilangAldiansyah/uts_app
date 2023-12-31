import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uts_app/list_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      title: 'UTS-App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListData(),
    ),
  );
}

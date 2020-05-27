import 'package:flutter/material.dart';
import 'file:///E:/LibraryOfTheWeakFlutter/flutter_dio/lib/pages/dio_example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter dio demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DioExample(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_summary/gallery/app.dart';
import 'package:flutter_summary/page/HomePage.dart';

void main() => runApp(GalleryApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

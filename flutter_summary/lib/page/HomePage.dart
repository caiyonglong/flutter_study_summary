import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_summary/page/AnimationPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageStates();
  }
}

class HomePageStates extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Study"),
      ),
      body: Container(
        color: Colors.black,
        child: SpriteAnimationWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

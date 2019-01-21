import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: Center(
          child: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.insert_emoticon),
              title: const Text('基础组件'),
              onTap: () {},
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sangeet/src/widgets/sidebar.dart';
import 'package:sangeet/src/widgets/themeSwitch.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ThemeSwitch(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
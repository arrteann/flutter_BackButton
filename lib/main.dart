import 'package:flutter/material.dart';
import 'dart:io';

main() => runApp(MaterialApp(
      title: 'Test BACK_BUTTON',
      home: myApp(),
    ));

class myApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => myAppState();
}

class myAppState extends State<myApp> {
  bool isBack = false;
  final _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Future<bool> _handlePop() async {
      if (isBack == false) {
        _scaffold.currentState.showSnackBar(
          new SnackBar(
            content: new Text('For exit press agian'),
          ),
        );
        setState(() {
          isBack = true;
        });
      } else {
        exit(0);
      }
    }

    return WillPopScope(
      child: new Scaffold(
        key: _scaffold,
        appBar: new AppBar(
          title: new Text('Back Test'),
        ),
      ),
      onWillPop: _handlePop,
    );
  }
}

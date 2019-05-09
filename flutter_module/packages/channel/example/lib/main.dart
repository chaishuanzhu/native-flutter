import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:channel/channel.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Channel.userID;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> getUserID() async {
    String userId;
    try {
      userId = await Channel.userID;
    } on PlatformException {
      userId = "Failed to get userID.";
    }
    setState(() {
      _platformVersion = userId;
    });
  }

  Future<void> sendData() async {
    String result;
    try {
      Map map = await Channel.sendData("value1", "value2");
      result = map.toString();
    } on PlatformException {
      result = "Failed to sendData.";
    }
    setState(() {
      _platformVersion = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Text('Running on: $_platformVersion\n'),
            RaisedButton(
              onPressed: () async {
                await getUserID();
              },
              child: Text("get userID"),
            ),
            RaisedButton(
              onPressed: () async {
                await sendData();
              },
              child: Text("sendData"),
            ),
          ],
        ),
      ),
    );
  }
}

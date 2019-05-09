import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'package:flutter/services.dart';
import 'package:channel/channel.dart';

class FirstRouteWidget extends StatelessWidget {

  final Map params;
  FirstRouteWidget(this.params);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {
          FlutterBoost.singleton.closePage("first", "page://native/page", {"key":"value"});
        }),
      ),
      body: Column(
        children: <Widget>[
          Text("key:" + "params" + "result:" + params.toString()),
          RaisedButton(
            child: Text('Open second route'),
            onPressed: () {
              FlutterBoost.singleton.openPage("page://native/page", {"key":"val-to-native"}, animated: true, resultHandler: (key, result) {
                print("key:" + key + "result:" + result.toString());
              });
            },
          ),
        ],
      ),
    );
  }
}

class SecondRouteWidget extends StatelessWidget {
  final Map params;
  SecondRouteWidget(this.params);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Column(
        children: <Widget>[
          Text("key:" + "params" + "result:" + params.toString()),
          RaisedButton(
            onPressed: () {
              // Navigate back to first route when tapped.
              FlutterBoost.singleton.closePageForContext(context);
            },
            child: Text('Go back!'),
          ),

          RaisedButton(
            onPressed: () {
              FlutterBoost.singleton.openPage("page://flutter/third", {"key":"value"});
            },
            child: Text("Go Third"),
          )
        ],
      ),
    );
  }
}


class ThirdRouterWidget extends StatefulWidget {

  @override
  _ThirdRouterWidgetState createState() => _ThirdRouterWidgetState();
}

class _ThirdRouterWidgetState extends State<ThirdRouterWidget> {
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

  Future<void> showDialog() async {
    String result;
    try {
      Map map = await Channel.showDialog("value1", "value2");
      result = map.toString();
    } on PlatformException {
      result = "Failed to showDialog.";
    }
    setState(() {
      _platformVersion = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {
          FlutterBoost.singleton.closePageForContext(context);
        }),
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

          RaisedButton(
            onPressed: () async {
              await showDialog();
            },
            child: Text("show Dialog"),
          )
        ],
      ),
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

  



class BodyWidget extends StatefulWidget {
  @override
  BodyWidgetState createState() {
    return new BodyWidgetState();
  }
}

class BodyWidgetState extends State<BodyWidget> {
  String serverResponse = 'Server response';

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Send request to server'),
                  onPressed: () {
                    _makeGetRequest();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(serverResponse),
                ),
              ],
            ),
          ),
        ),
      ),
      )
    );
  }

  _makeGetRequest() async {
    Response response = await get(_localhost());
    setState(() {
      serverResponse = response.body;
    });
  }

  String _localhost() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:3000';
    else // for iOS simulator
      return 'http://localhost:3000';
  }
}
import 'package:blogapp/utils/constants.dart';
import 'package:flutter/material.dart';

class favorites extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: C_3,
        title: Text('favorite'),
      ),
      body: Center(
        child: Text("favorite"),
      ),
    );
  }
}

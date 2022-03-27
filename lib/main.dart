import 'package:flutter/material.dart';
import 'package:ha_tunnel_plus_ui_design/Color/colors.dart';

import 'Responsiveness/reponsive.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      title: 'HA Tunnel Plus',
      theme: ThemeData(
        backgroundColor: Colors.black
      ),
      home: const Responsive(),
    );
  }
}

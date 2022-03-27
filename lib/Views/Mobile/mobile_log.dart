import 'package:flutter/material.dart';
import 'package:ha_tunnel_plus_ui_design/Color/colors.dart';

class MobileLog extends StatefulWidget {
  const MobileLog({ Key? key }) : super(key: key);

  @override
  State<MobileLog> createState() => _MobileLogState();
}

class _MobileLogState extends State<MobileLog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.access_alarm_outlined, color: iconColor,),
    );
  }
}
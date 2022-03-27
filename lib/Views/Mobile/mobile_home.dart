import 'package:flutter/material.dart';

import '../../Color/colors.dart';

class MobileHome extends StatefulWidget {
  const MobileHome({ Key? key }) : super(key: key);

  @override
  State<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends State<MobileHome> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.access_alarm_outlined,color: Colors.red,),
    );
  }
}
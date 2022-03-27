import 'package:flutter/cupertino.dart';

import '../Screen/mobile.dart';
import '../Screen/tablet.dart';

class Responsive extends StatefulWidget {
  const Responsive({Key? key}) : super(key: key);

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth < 600) {
            return const Mobile();
          } else {
            return const Tablet();
          }
        }
    );
  }
}

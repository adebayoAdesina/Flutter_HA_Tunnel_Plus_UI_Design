import 'package:flutter/material.dart';

import 'mobile.dart';

class Tablet extends StatelessWidget {
  const Tablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: const Mobile(),
        ),
      ),
    );
  }
}

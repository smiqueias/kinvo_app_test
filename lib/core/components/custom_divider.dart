import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double rigth;
  final double left;

  const CustomDivider({
    this.rigth = 0,
    this.left = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        right: rigth,
        left: rigth,
      ),
      height: 1,
      color: Colors.black12.withOpacity(0.1),
    );
  }
}

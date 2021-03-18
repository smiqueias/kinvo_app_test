import 'package:flutter/material.dart';
import '../../config/ui_pallete.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Color color;
  const CustomChip({Key? key, required this.label, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 20,
      width: label == 'Fechado' ? 70 : 55,
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 11,
            color: UiPallete.pallete['white'],
          ),
        ),
      ),
    );
  }
}

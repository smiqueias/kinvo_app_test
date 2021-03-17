import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';

class CustomAppBar extends StatelessWidget {
  final String? label;

  const CustomAppBar({
    Key? key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: label == 'Desafio' ? UiPallete.pallete['white'] : null,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            label!,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: UiPallete.pallete['text-color'],
            ),
          ),
        ),
      ),
    );
  }
}

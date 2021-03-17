import 'package:flutter/material.dart';
import '../../config/ui_pallete.dart';
import '../../modules/stocks/stocks_controller.dart';

class CustomErrorScreen extends StatelessWidget {
  final StocksController controller;

  const CustomErrorScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        primary: UiPallete.pallete['text-color'],
      ),
      onPressed: () => controller.fetchStocks(),
      child: Text(
        'TENTAR NOVAMENTE',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: UiPallete.pallete['white'],
        ),
      ),
    );
  }
}

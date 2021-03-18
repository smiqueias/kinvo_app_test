import 'package:flutter/material.dart';
import '../../config/ui_pallete.dart';

class CustomErrorScreen extends StatelessWidget {
  final Function onPressed;
  final Size size;

  const CustomErrorScreen({
    Key? key,
    required this.onPressed,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ocorreu um erro.',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: UiPallete.pallete['blue-grey-1'],
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          'Não foi possível se conectar ao banco de fundos.',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: UiPallete.pallete['blue-grey-1'],
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            primary: UiPallete.pallete['text-color'],
          ),
          onPressed: () {
            onPressed;
          },
          child: Text(
            'TENTAR NOVAMENTE',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: UiPallete.pallete['white'],
            ),
          ),
        ),
      ],
    );
  }
}

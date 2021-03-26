import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        'Nenhum resultado foi encontrado \n para os filtros selecionados.',
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: UiPallete.pallete['blue-grey-1'],
        ),
      ),
    );
  }
}

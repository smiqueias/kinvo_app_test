import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/core/components/custom_chip.dart';
import 'package:kinvo_mobile_test/data/model/funds_model.dart';
import '../../../core/extensions/string_extension.dart';
import '../funds_controller.dart';

class FundsNameRow extends StatelessWidget {
  final FundsController controller;
  final int index;
  final List<Datum> fundsList;

  const FundsNameRow({
    Key? key,
    required this.controller,
    required this.index,
    required this.fundsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fundsList.sort((a, b) => a.name.compareTo(b.name));
    return Row(
      children: [
        Text(
          fundsList[index].name.intelliTrim(),
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: fundsList[index].status == 2
                ? Color.fromRGBO(98, 113, 121, 1).withOpacity(0.5)
                : UiPallete.pallete['blue-grey-1'],
          ),
        ),
        _buildCustomChip(fundsList, index),
      ],
    );
  }

  _buildCustomChip(List<Datum> value, int index) {
    switch (value[index].status) {
      case 0:
        return SizedBox.shrink();
      case 1:
        return CustomChip(
          color: UiPallete.pallete['cyan']!,
          label: 'Novo',
        );
      case 2:
        return CustomChip(
          color: UiPallete.pallete['grey']!,
          label: 'Fechado',
        );
      default:
    }
  }
}

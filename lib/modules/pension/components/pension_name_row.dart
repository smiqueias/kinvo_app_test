import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/data/model/pension_model.dart';
import 'package:kinvo_mobile_test/modules/pension/pension_controller.dart';
import '../../../core/extensions/string_extension.dart';

class PensionNameRow extends StatelessWidget {
  final PensionController controller;
  final int index;
  final List<Datum> pensionList;

  const PensionNameRow({
    Key? key,
    required this.controller,
    required this.index,
    required this.pensionList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pensionList.sort((a, b) => a.name.compareTo(b.name));
    return Row(
      children: [
        Text(
          pensionList[index].name.intelliTrim(),
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: UiPallete.pallete['blue-grey-1'],
          ),
        ),
      ],
    );
  }
}

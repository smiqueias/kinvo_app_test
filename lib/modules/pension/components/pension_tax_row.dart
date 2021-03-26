import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/data/model/pension_model.dart';

class PensionTaxRow extends StatelessWidget {
  final List<Datum> pensionList;
  final int index;

  const PensionTaxRow({
    Key? key,
    required this.pensionList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Taxa:',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: UiPallete.pallete['blue-grey-1'],
            ),
          ),
          Text(
            pensionList[index].tax.toString().replaceFirst('.', ',') + "%",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: UiPallete.pallete['blue-grey-1'],
            ),
          ),
        ],
      ),
    );
  }
}

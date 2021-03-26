import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/data/model/pension_model.dart';

class PensionMinimumValueRow extends StatelessWidget {
  final List<Datum> pensionList;
  final int index;

  const PensionMinimumValueRow({
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
            'Valor mínimo:',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: UiPallete.pallete['blue-grey-1'],
            ),
          ),
          Text(
            NumberFormat.currency(
              name: "R\$",
              locale: 'pt-br',
            ).format(
              pensionList[index].minimumValue,
            ),
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

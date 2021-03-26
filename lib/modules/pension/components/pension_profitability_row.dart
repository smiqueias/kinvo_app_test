import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/data/model/pension_model.dart';

class PensionProfitabilityRow extends StatelessWidget {
  final List<Datum> pensionList;
  final int index;

  const PensionProfitabilityRow({
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
            'Rentabilidade:',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: UiPallete.pallete['blue-grey-1'],
            ),
          ),
          Row(
            children: [
              Icon(
                pensionList[index].profitability < 0
                    ? Icons.arrow_downward_rounded
                    : Icons.arrow_upward_sharp,
                size: 13,
                color: colorsControl(pensionList, index),
              ),
              Text(
                pensionList[index].profitability.toString() + "%",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: colorsControl(pensionList, index),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Color colorsControl(List<Datum> fundsList, int index) {
    if (fundsList[index].profitability < 0) {
      return UiPallete.pallete['orange'];
    } else {
      return UiPallete.pallete['green'];
    }
  }
}

import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/data/model/funds_model.dart';

class FundsProfitabilityRow extends StatelessWidget {
  final List<Datum> fundsList;
  final int index;

  const FundsProfitabilityRow({
    Key? key,
    required this.fundsList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Rentabilidade:',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: fundsList[index].status == 2
                ? Color.fromRGBO(98, 113, 121, 1).withOpacity(0.5)
                : UiPallete.pallete['blue-grey-1'],
          ),
        ),
        Row(
          children: [
            Icon(
              fundsList[index].profitability < 0
                  ? Icons.arrow_downward_rounded
                  : Icons.arrow_upward_sharp,
              size: 13,
              color: fundsList[index].profitability < 0
                  ? UiPallete.pallete['orange']
                  : Colors.green,
            ),
            Text(
              fundsList[index].profitability.toString() + "%",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: colorsControl(fundsList, index),
              ),
            )
          ],
        )
      ],
    );
  }

  Color colorsControl(List<Datum> fundsList, int index) {
    if (fundsList[index].status == 2) {
      return Color.fromRGBO(98, 113, 121, 1).withOpacity(0.5);
    } else if (fundsList[index].profitability < 0) {
      return UiPallete.pallete['orange'];
    } else {
      return UiPallete.pallete['green'];
    }
  }
}

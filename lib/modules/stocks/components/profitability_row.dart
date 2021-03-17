import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/data/model/stocks_model.dart';

class ProfitabilityRow extends StatelessWidget {
  final List<Datum> stocksList;
  final int index;

  const ProfitabilityRow({
    Key? key,
    required this.stocksList,
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
            color: UiPallete.pallete['blue-grey-1'],
          ),
        ),
        Row(
          children: [
            Icon(
              stocksList[index].profitability! < 0
                  ? Icons.arrow_downward_rounded
                  : Icons.arrow_upward_sharp,
              size: 13,
              color: stocksList[index].profitability! < 0
                  ? UiPallete.pallete['orange']
                  : Colors.green,
            ),
            Text(
              stocksList[index].profitability.toString() + "%",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: stocksList[index].profitability! < 0
                    ? UiPallete.pallete['orange']
                    : Colors.green,
              ),
            )
          ],
        )
      ],
    );
  }
}

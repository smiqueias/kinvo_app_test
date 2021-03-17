import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/data/model/stocks_model.dart';

class MinimumValueRow extends StatelessWidget {
  final List<Datum> stocksList;
  final int index;

  const MinimumValueRow({
    Key? key,
    required this.stocksList,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
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
              stocksList[index].minimumValue,
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

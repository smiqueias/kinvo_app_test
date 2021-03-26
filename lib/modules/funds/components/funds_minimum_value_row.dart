import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/data/model/funds_model.dart';

class FundsMinimumValueRow extends StatelessWidget {
  final List<Datum> fundsList;
  final int index;

  const FundsMinimumValueRow({
    Key? key,
    required this.fundsList,
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
              color: fundsList[index].status == 2
                  ? Color.fromRGBO(98, 113, 121, 1).withOpacity(0.5)
                  : UiPallete.pallete['blue-grey-1'],
            ),
          ),
          Text(
            NumberFormat.currency(
              name: "R\$",
              locale: 'pt-br',
            ).format(
              fundsList[index].minimumValue,
            ),
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: fundsList[index].status == 2
                  ? Color.fromRGBO(98, 113, 121, 1).withOpacity(0.5)
                  : UiPallete.pallete['blue-grey-1'],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/core/components/custom_divider.dart';
import 'package:kinvo_mobile_test/data/model/pension_model.dart';
import '../pension_controller.dart';
import 'pension_minimum_value_row.dart';
import 'pension_name_row.dart';
import 'pension_profitability_row.dart';
import 'pension_redemption_term_row.dart';
import 'pension_tax_row.dart';

class PensionList extends StatelessWidget {
  final PensionModel pension;
  final List<Datum> pensionList;
  final Size size;
  final PensionController controller;

  const PensionList({
    Key? key,
    required this.pension,
    required this.size,
    required this.controller,
    required this.pensionList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pensionList.length,
      itemBuilder: (_, index) {
        return Container(
          margin: EdgeInsets.only(
            bottom: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            border: Border.all(
              color: Colors.blueGrey[100]!,
            ),
            color: UiPallete.pallete['white'],
          ),
          height: 205,
          width: 185,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PensionNameRow(
                  controller: controller,
                  index: index,
                  pensionList: pensionList,
                ),
                SizedBox(
                  height: size.height * 0.003,
                ),
                Text(
                  pension.data[index].type.toUpperCase(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: UiPallete.pallete['blue-grey-1'],
                  ),
                ),
                CustomDivider(),
                PensionMinimumValueRow(
                  pensionList: pensionList,
                  index: index,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionTaxRow(
                  index: index,
                  pensionList: pensionList,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionRedemptionTermRow(
                  index: index,
                  pensionList: pensionList,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionProfitabilityRow(
                  index: index,
                  pensionList: pensionList,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

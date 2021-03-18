import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/core/components/custom_appbar.dart';
import 'package:kinvo_mobile_test/core/components/custom_divider.dart';
import 'package:kinvo_mobile_test/data/model/funds_model.dart';
import 'package:kinvo_mobile_test/data/repositories/funds_repository.dart';
import 'package:kinvo_mobile_test/modules/funds/funds_controller.dart';
import 'package:kinvo_mobile_test/modules/home/home_screen.dart';
import 'components/custom_rating_bar.dart';
import 'components/funds_name_row.dart';
import 'components/funds_profitability_row_.dart';
import 'components/funs_minimum_value_row.dart';

class FundsScreen extends StatelessWidget {
  static const String PAGE_ROUTE = "/funds";
  final controller = Get.put(FundsController(FundsRepository(Dio())))!;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              CustomAppBar(
                label: 'Fundos',
              ),
              Expanded(
                flex: 6,
                child: Container(
                  color: UiPallete.pallete['blue-grey-2'],
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 25,
                      bottom: 25,
                    ),
                    child: controller.obx(
                      (state) {
                        final FundsModel funds = state;
                        return RefreshIndicator(
                          onRefresh: () => controller.fetchFunds(),
                          child: ListView.builder(
                            itemCount: 5,
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
                                  color: funds.data[index].status == 2
                                      ? UiPallete.pallete['white-3']
                                      : UiPallete.pallete['white'],
                                ),
                                height: 185,
                                width: 185,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      FundsNameRow(
                                        controller: controller,
                                        fundsList: funds.data,
                                        index: index,
                                      ),
                                      Text(
                                        funds.data[index].type,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: funds.data[index].status == 2
                                              ? Color.fromRGBO(98, 113, 121, 1)
                                                  .withOpacity(0.5)
                                              : UiPallete
                                                  .pallete['blue-grey-1'],
                                        ),
                                      ),
                                      CustomDivider(),
                                      CustomRatingBar(
                                        funds: funds.data,
                                        index: index,
                                      ),
                                      FundsMinimumValueRow(
                                        index: index,
                                        fundsList: funds.data,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      FundsProfitabilityRow(
                                        fundsList: funds.data,
                                        index: index,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      onLoading: Center(child: CircularProgressIndicator()),
                      onError: (_) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Ocorreu um erro.',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: UiPallete.pallete['blue-grey-1'],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            'Não foi possível se conectar ao banco de fundos.',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: UiPallete.pallete['blue-grey-1'],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              primary: UiPallete.pallete['text-color'],
                            ),
                            onPressed: () => controller.fetchFunds(),
                            child: Text(
                              'TENTAR NOVAMENTE',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: UiPallete.pallete['white'],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

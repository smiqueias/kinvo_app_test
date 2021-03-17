import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/core/components/custom_appbar.dart';
import 'package:kinvo_mobile_test/core/components/custom_error_screen.dart';
import 'package:kinvo_mobile_test/data/model/stocks_model.dart';
import 'package:kinvo_mobile_test/data/repositories/stocks_repository.dart';
import 'package:kinvo_mobile_test/modules/home/home_screen.dart';
import 'package:kinvo_mobile_test/modules/stocks/stocks_controller.dart';
import '../../core/components/custom_divider.dart';
import 'components/minimum_value_row.dart';
import 'components/profitability_row.dart';
import 'components/stocks_name_row.dart';

class StocksScreen extends StatelessWidget {
  static const String PAGE_ROUTE = "/actions";
  final controller = Get.put(StocksController(StocksRepository(Dio())))!;
  final StocksrModel stocksrModel = StocksrModel();

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
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          HomeScreen.PAGE_ROUTE,
                        ),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: UiPallete.pallete['text-color'],
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.keyboard_arrow_left_rounded,
                              color: UiPallete.pallete['white']!.withOpacity(
                                0.7,
                              ),
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      CustomAppBar(
                        label: 'Ações',
                      )
                    ],
                  ),
                ),
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
                        final StocksrModel stock = state;
                        return RefreshIndicator(
                          onRefresh: () => controller.fetchStocks(),
                          child: ListView.builder(
                            itemCount: stock.data!.length,
                            itemBuilder: (context, index) {
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
                                height: 160,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 17,
                                    top: 4,
                                    right: 6,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      StocksNameRow(
                                        controller: controller,
                                        index: index,
                                        stocksList: stock.data!,
                                      ),
                                      Text(
                                        stock.data![index].ticker!,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              UiPallete.pallete['blue-grey-1'],
                                        ),
                                      ),
                                      CustomDivider(),
                                      MinimumValueRow(
                                        index: index,
                                        stocksList: stock.data!,
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      ProfitabilityRow(
                                        stocksList: stock.data!,
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
                      onError: (error) {
                        return Column(
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
                            CustomErrorScreen(
                              controller: controller,
                            ),
                          ],
                        );
                      },
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

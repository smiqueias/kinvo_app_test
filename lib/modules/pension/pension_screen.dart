import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/core/components/custom_appbar.dart';
import 'package:kinvo_mobile_test/core/components/custom_divider.dart';
import 'package:kinvo_mobile_test/core/components/not_found_screen.dart';
import 'package:kinvo_mobile_test/data/model/pension_model.dart';
import 'package:kinvo_mobile_test/data/repositories/pension_repository.dart';
import 'package:kinvo_mobile_test/modules/pension/pension_controller.dart';
import 'components/pension_minimum_value_row.dart';
import 'components/pension_name_row.dart';
import 'components/pension_profitability_row.dart';
import 'components/pension_redemption_term_row.dart';
import 'components/pension_tax_row.dart';

class PensionScreen extends StatefulWidget {
  static const String PAGE_ROUTE = "/pension";

  @override
  _PensionScreenState createState() => _PensionScreenState();
}

class _PensionScreenState extends State<PensionScreen> {
  final controller = Get.put(PensionController(PensionRepository(Dio())))!;

  List<String> filters = [
    'SEM TAXA',
    'R\$ 100,00',
    'D+1',
  ];

  List<String> selectedFilter = [];

  _buildChips() {
    List<Widget> chips = [];
    filters.forEach((filter) {
      chips.add(Container(
        padding: const EdgeInsets.all(12.0),
        child: ChoiceChip(
          backgroundColor: UiPallete.pallete['white'],
          label: Text(filter),
          labelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: selectedFilter.contains(filter)
                ? UiPallete.pallete['white']
                : UiPallete.pallete['blue-grey-1'],
          ),
          labelPadding: filter == "D+1"
              ? EdgeInsets.symmetric(horizontal: 28)
              : EdgeInsets.symmetric(horizontal: 20),
          selected: selectedFilter.contains(filter),
          selectedColor: UiPallete.pallete['text-color'],
          onSelected: (selected) {
            setState(() {
              selectedFilter.contains(filter)
                  ? selectedFilter.remove(filter)
                  : selectedFilter.add(filter);
            });
          },
        ),
      ));
    });

    print(selectedFilter);

    return chips;
  }

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
                label: "Previdências",
              ),
              Expanded(
                flex: 6,
                child: Container(
                  color: UiPallete.pallete['blue-grey-2'],
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _buildChips(),
                      ),
                      CustomDivider(
                        rigth: 20,
                        left: 20,
                      ),
                      Expanded(
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
                                final PensionModel pension = state;

                                if (selectedFilter.contains('SEM TAXA') &&
                                    selectedFilter.contains('R\$ 100,00')) {
                                  return _buildListWithMinimumValueOneHundredAndNoFeeFilters(
                                    pension,
                                    size,
                                  );
                                } else if (selectedFilter
                                        .contains('SEM TAXA') &&
                                    selectedFilter.contains('D+1')) {
                                  return _buildListWithNoFeeAndRansomEqualOneFilters(
                                    pension,
                                    size,
                                  );
                                } else if (selectedFilter
                                        .contains('R\$ 100,00') &&
                                    selectedFilter.contains('D+1')) {
                                  return _buildListWithRansomEqualOneAndMinimumValueOneHundred(
                                    pension,
                                    size,
                                  );
                                } else if (selectedFilter
                                    .contains('SEM TAXA')) {
                                  return _buildListWithNoFeeFilter(
                                    pension,
                                    size,
                                  );
                                } else if (selectedFilter
                                    .contains('R\$ 100,00')) {
                                  return _buildListWithMinimumValueOneHundredFilter(
                                    pension,
                                    size,
                                  );
                                } else if (selectedFilter.contains('D+1')) {
                                  return _buildListWithRansomEqualOneFilter(
                                    pension,
                                    size,
                                  );
                                } else {
                                  return _buildListWithoutFilters(
                                    pension,
                                    size,
                                  );
                                }
                              },
                              onLoading: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 60,
                                ),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ),
                              onError: (_) => Center(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 60,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Ocorreu um erro.',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              UiPallete.pallete['blue-grey-1'],
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
                                          color:
                                              UiPallete.pallete['blue-grey-1'],
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          primary:
                                              UiPallete.pallete['text-color'],
                                        ),
                                        onPressed: () =>
                                            controller.fetchPensions(),
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
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListWithoutFilters(PensionModel pension, Size size) {
    return ListView.builder(
      itemCount: pension.data.length,
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
                  pensionList: pension.data,
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
                  pensionList: pension.data,
                  index: index,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionTaxRow(
                  index: index,
                  pensionList: pension.data,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionRedemptionTermRow(
                  index: index,
                  pensionList: pension.data,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionProfitabilityRow(
                  index: index,
                  pensionList: pension.data,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListWithNoFeeFilter(PensionModel pension, Size size) {
    List<Datum> pensionListFiltered =
        pension.data.where((pension) => pension.tax == 0).toList();
    pensionListFiltered.sort((a, b) => a.name.compareTo(b.name));

    if (pensionListFiltered.length == 0) {
      return NotFoundScreen();
    }

    return ListView.builder(
      itemCount: pensionListFiltered.length,
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
                  pensionList: pensionListFiltered,
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
                  pensionList: pensionListFiltered,
                  index: index,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionTaxRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionRedemptionTermRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionProfitabilityRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListWithMinimumValueOneHundredFilter(
      PensionModel pension, Size size) {
    List<Datum> pensionListFiltered =
        pension.data.where((pension) => pension.minimumValue <= 100).toList();
    pensionListFiltered.sort((a, b) => a.name.compareTo(b.name));

    if (pensionListFiltered.length == 0) {
      return NotFoundScreen();
    }

    return ListView.builder(
      itemCount: pensionListFiltered.length,
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
                  pensionList: pensionListFiltered,
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
                  pensionList: pensionListFiltered,
                  index: index,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionTaxRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionRedemptionTermRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionProfitabilityRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListWithRansomEqualOneFilter(PensionModel pension, Size size) {
    List<Datum> pensionListFiltered =
        pension.data.where((pension) => pension.redemptionTerm == 1).toList();
    pensionListFiltered.sort((a, b) => a.name.compareTo(b.name));

    if (pensionListFiltered.length == 0) {
      return NotFoundScreen();
    }

    return ListView.builder(
      itemCount: pensionListFiltered.length,
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
                  pensionList: pensionListFiltered,
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
                  pensionList: pensionListFiltered,
                  index: index,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionTaxRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionRedemptionTermRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionProfitabilityRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListWithMinimumValueOneHundredAndNoFeeFilters(
      PensionModel pension, Size size) {
    List<Datum> pensionListFiltered = pension.data
        .where((pension) => pension.tax == 0 && pension.minimumValue <= 100)
        .toList();
    pensionListFiltered.sort((a, b) => a.name.compareTo(b.name));

    if (pensionListFiltered.length == 0) {
      return NotFoundScreen();
    }

    return ListView.builder(
      itemCount: pensionListFiltered.length,
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
                  pensionList: pensionListFiltered,
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
                  pensionList: pensionListFiltered,
                  index: index,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionTaxRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionRedemptionTermRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionProfitabilityRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListWithNoFeeAndRansomEqualOneFilters(
      PensionModel pension, Size size) {
    List<Datum> pensionListFiltered = pension.data
        .where((pension) => pension.redemptionTerm == 1 && pension.tax == 0)
        .toList();
    pensionListFiltered.sort((a, b) => a.name.compareTo(b.name));

    if (pensionListFiltered.length == 0) {
      return NotFoundScreen();
    }

    return ListView.builder(
      itemCount: pensionListFiltered.length,
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
                  pensionList: pensionListFiltered,
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
                  pensionList: pensionListFiltered,
                  index: index,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionTaxRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionRedemptionTermRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionProfitabilityRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListWithRansomEqualOneAndMinimumValueOneHundred(
      PensionModel pension, Size size) {
    List<Datum> pensionListFiltered = pension.data
        .where((pension) =>
            pension.redemptionTerm == 1 && pension.minimumValue <= 100)
        .toList();
    pensionListFiltered.sort((a, b) => a.name.compareTo(b.name));

    if (pensionListFiltered.length == 0) {
      return NotFoundScreen();
    }

    return ListView.builder(
      itemCount: pensionListFiltered.length,
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
                  pensionList: pensionListFiltered,
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
                  pensionList: pensionListFiltered,
                  index: index,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionTaxRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionRedemptionTermRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                PensionProfitabilityRow(
                  index: index,
                  pensionList: pensionListFiltered,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

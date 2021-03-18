import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/core/components/custom_appbar.dart';
import 'package:kinvo_mobile_test/modules/funds/funds_screen.dart';
import 'package:kinvo_mobile_test/modules/stocks/stocks_screen.dart';
import 'components/custom_card.dart';

class HomeScreen extends StatelessWidget {
  static const String PAGE_ROUTE = "";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: UiPallete.pallete['white'],
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: CustomAppBar(
                  label: 'Desafio',
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  width: double.maxFinite,
                  color: UiPallete.pallete['blue-grey-2'],
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 25,
                      bottom: 25,
                    ),
                    child: Column(
                      children: [
                        CustomCard(
                          assetname: "assets/svgs/acoes_icon.svg",
                          label1: 'Ações',
                          label2: 'Nacionais',
                          size: size,
                          onTap: () => Navigator.pushNamed(
                            context,
                            StocksScreen.PAGE_ROUTE,
                          ),
                        ),
                        Divider(
                          color: Colors.transparent,
                        ),
                        CustomCard(
                          assetname: "assets/svgs/fundos_icon.svg",
                          label1: 'Fundos',
                          label2: 'De investimentos',
                          size: size,
                          onTap: () => Navigator.pushNamed(
                            context,
                            FundsScreen.PAGE_ROUTE,
                          ),
                        ),
                        Divider(
                          color: Colors.transparent,
                        ),
                        CustomCard(
                          assetname: "assets/svgs/prev_icon.svg",
                          label1: 'Previdências',
                          label2: 'Privadas',
                          size: size,
                          onTap: () => print('previdencias'),
                        ),
                      ],
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

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/core/utils/constants/hive_boxs.dart';
import 'package:kinvo_mobile_test/modules/home/home_screen.dart';
import 'modules/stocks/stocks_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(FAVORITES_BOX);
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(),
      theme: UiPallete.appTheme,
      initialRoute: HomeScreen.PAGE_ROUTE,
      routes: {
        HomeScreen.PAGE_ROUTE: (_) => HomeScreen(),
        StocksScreen.PAGE_ROUTE: (_) => StocksScreen(),
      },
    );
  }
}

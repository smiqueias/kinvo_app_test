import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/core/components/custom_appbar.dart';

class PensionScreen extends StatelessWidget {
  static const String PAGE_ROUTE = "/pension";

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
                child: Text(''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/core/utils/constants/hive_boxs.dart';
import 'package:kinvo_mobile_test/data/model/stocks_model.dart';
import 'package:kinvo_mobile_test/modules/stocks/stocks_controller.dart';

class StocksNameRow extends StatelessWidget {
  final StocksController controller;
  final int index;
  final List<Datum> stocksList;
  StocksNameRow({
    Key? key,
    required this.controller,
    required this.index,
    required this.stocksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    stocksList.sort((a, b) => a.name!.compareTo(b.name!));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          stocksList[index].name!,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: UiPallete.pallete['blue-grey-1'],
          ),
        ),
        ValueListenableBuilder(
          valueListenable: Hive.box(FAVORITES_BOX).listenable(),
          builder: (context, box, _) {
            return IconButton(
              icon: Icon(
                Hive.box(FAVORITES_BOX).containsKey(index)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              color: UiPallete.pallete['text-color'],
              onPressed: () {
                if (Hive.box(FAVORITES_BOX).containsKey(index)) {
                  Hive.box(FAVORITES_BOX).delete(index);
                } else {
                  Hive.box(FAVORITES_BOX).put(index, true);
                }
              },
            );
          },
        )
      ],
    );
  }
}

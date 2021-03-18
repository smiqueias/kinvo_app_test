import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/data/model/funds_model.dart';

class CustomRatingBar extends StatelessWidget {
  final List<Datum> funds;
  final int index;

  const CustomRatingBar({
    Key? key,
    required this.funds,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Classificação:',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: funds[index].status == 2
                  ? Color.fromRGBO(98, 113, 121, 1).withOpacity(0.5)
                  : UiPallete.pallete['blue-grey-1'],
            ),
          ),
          RatingBar.builder(
            itemSize: 20,
            initialRating: funds[index].rating.toDouble(),
            ignoreGestures: true,
            allowHalfRating: true,
            onRatingUpdate: (r) => print(r),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: funds[index].status == 2
                  ? UiPallete.pallete['blue-grey-1']
                  : UiPallete.pallete['amber'],
            ),
          )
        ],
      ),
    );
  }
}

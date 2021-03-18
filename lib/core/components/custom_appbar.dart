import 'package:flutter/material.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';
import 'package:kinvo_mobile_test/modules/home/home_screen.dart';

class CustomAppBar extends StatelessWidget {
  final String label;

  const CustomAppBar({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Visibility(
              visible: label != "Desafio",
              child: GestureDetector(
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
            ),
            Container(
              color: label == 'Desafio' ? UiPallete.pallete['text'] : null,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: UiPallete.pallete['text-color'],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

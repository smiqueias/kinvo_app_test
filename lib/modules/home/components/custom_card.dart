import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kinvo_mobile_test/config/ui_pallete.dart';

class CustomCard extends StatelessWidget {
  final String assetname;
  final String label1;
  final String label2;
  final Size size;
  final Function onTap;

  const CustomCard({
    Key? key,
    required this.assetname,
    required this.label1,
    required this.label2,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: Colors.blueGrey[100]!,
          ),
          color: UiPallete.pallete['white'],
        ),
        height: 120,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 27,
                backgroundColor: UiPallete.pallete['white-2'],
                child: SvgPicture.asset(
                  assetname,
                  color: UiPallete.pallete['text-color'],
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label1,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: UiPallete.pallete['text-color'],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.004,
                  ),
                  Text(
                    label2,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: UiPallete.pallete['text-color-2'],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.004,
                  ),
                ],
              ),
              SizedBox(
                width: size.width * 0.2,
              ),
              Visibility(
                visible: label1 == 'Fundos',
                child: Container(
                  decoration: BoxDecoration(
                    color: UiPallete.pallete['cyan'],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 20,
                  width: 55,
                  child: Center(
                    child: Text(
                      'Novo',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 11,
                        color: UiPallete.pallete['white'],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

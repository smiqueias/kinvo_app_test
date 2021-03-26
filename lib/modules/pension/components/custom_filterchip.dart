// import 'package:flutter/material.dart';
// import 'package:kinvo_mobile_test/config/ui_pallete.dart';

// class TabFilterChip extends StatelessWidget {
//   const TabFilterChip({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<String> labels = [
//       'SEM TAXA',
//       'R\$ 100,00',
//       'D+1',
//     ];

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: List.generate(
//         3,
//         (index) {
//           return Transform(
//             transform: Matrix4.identity()..scale(1.1),
//             child: FilterChip(
//               backgroundColor: UiPallete.pallete['white'],
//               label: Text(labels[index]),
//               labelPadding: labels[index] == "D+1"
//                   ? EdgeInsets.symmetric(horizontal: 26)
//                   : null,
//               selectedColor: Colors.yellow,
//               shape: StadiumBorder(),
//               showCheckmark: false,
//               selected: true,
//               labelStyle: TextStyle(
//                 fontFamily: 'Montserrat',
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//                 color: UiPallete.pallete['blue-grey-1'],
//               ),
//               onSelected: (s) => {print(s)},
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

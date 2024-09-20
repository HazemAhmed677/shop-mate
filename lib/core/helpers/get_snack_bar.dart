// import 'package:flutter/material.dart';

// void getShowSnackBar(BuildContext context, String content, double padding) {
//   try {
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           // behavior: SnackBarBehavior.fixed, // This makes the SnackBar floating
//           padding: const EdgeInsets.symmetric(
//             vertical: 12,
//             horizontal: 13,
//           ),
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(18),
//               topRight: Radius.circular(18),
//               // bottomLeft: Radius.circular(9),
//               // bottomRight: Radius.circular(9),
//             ),
//           ),
//           duration: const Duration(seconds: 1),
//           backgroundColor: const Color.fromARGB(255, 228, 223, 223),
//           content: Text(
//             content,
//             style: const TextStyle(
//               fontSize: 16,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         snackBarAnimationStyle: AnimationStyle(
//           duration: Duration(seconds: 1),
//           curve: Curves.easeInOutCubicEmphasized,
//         ));
//   } catch (e) {
//     //
//   }
// }

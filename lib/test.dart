// // //*********************************************  boy and girl mode   *****************************

// import 'package:flutter/material.dart';

// class BoyGirlSwitchScreen extends StatefulWidget {
//   const BoyGirlSwitchScreen({Key? key}) : super(key: key);

//   @override
//   _BoyGirlSwitchScreenState createState() => _BoyGirlSwitchScreenState();
// }

// class _BoyGirlSwitchScreenState extends State<BoyGirlSwitchScreen> {
//   bool isBoyMode = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: isBoyMode ? Colors.blue[100] : Colors.pink[100],
//       body: Center(
//         child: GestureDetector(
//           onTap: () {
//             setState(() {
//               isBoyMode = !isBoyMode;
//             });
//           },
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 500),
//             width: 120,
//             height: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(30),
//               color: isBoyMode ? Colors.blue : Colors.pink,
//               border: Border.all(color: Colors.white, width: 2),
//             ),
//             child: Stack(
//               children: [
//                 // Boy & Girl Icons
//                 Positioned(
//                   left: isBoyMode ? 15 : 75,
//                   top: 12,
//                   child: AnimatedSwitcher(
//                     duration: const Duration(milliseconds: 500),
//                     transitionBuilder: (child, animation) {
//                       return ScaleTransition(scale: animation, child: child);
//                     },
//                     child: isBoyMode
//                         ? const Icon(Icons.boy,
//                             color: Colors.white, size: 26, key: ValueKey("boy"))
//                         : const Icon(Icons.girl,
//                             color: Colors.white,
//                             size: 26,
//                             key: ValueKey("girl")),
//                   ),
//                 ),

//                 // Sliding Button
//                 AnimatedAlign(
//                   duration: const Duration(milliseconds: 500),
//                   curve: Curves.easeInOut,
//                   alignment:
//                       isBoyMode ? Alignment.centerLeft : Alignment.centerRight,
//                   child: Container(
//                     margin: const EdgeInsets.all(5),
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                     ),
//                     child: Center(
//                       child: AnimatedSwitcher(
//                         duration: const Duration(milliseconds: 500),
//                         child: isBoyMode
//                             ? const Text("👦",
//                                 style: TextStyle(fontSize: 30),
//                                 key: ValueKey("boy"))
//                             : const Text("👧",
//                                 style: TextStyle(fontSize: 30),
//                                 key: ValueKey("girl")),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// // //*********************************************  dark and light mode   *****************************
// // // import 'package:flutter/material.dart';


// // // class DarkModeSwitchScreen extends StatefulWidget {
// // //   const DarkModeSwitchScreen({Key? key}) : super(key: key);

// // //   @override
// // //   _DarkModeSwitchScreenState createState() => _DarkModeSwitchScreenState();
// // // }

// // // class _DarkModeSwitchScreenState extends State<DarkModeSwitchScreen> {
// // //   bool isDarkMode = false;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: isDarkMode ? Colors.black : Colors.white,
// // //       body: Center(
// // //         child: GestureDetector(
// // //           onTap: () {
// // //             setState(() {
// // //               isDarkMode = !isDarkMode;
// // //             });
// // //           },
// // //           child: AnimatedContainer(
// // //             duration: const Duration(milliseconds: 500),
// // //             width: 100,
// // //             height: 50,
// // //             decoration: BoxDecoration(
// // //               borderRadius: BorderRadius.circular(30),
// // //               color: isDarkMode ? Colors.black : Colors.white,
// // //               border: Border.all(color: Colors.white, width: 2),
// // //             ),
// // //             child: Stack(
// // //               children: [
// // //                 // Background Elements
// // //                 Positioned(
// // //                   left: isDarkMode ? 10 : 60,
// // //                   top: 10,
// // //                   child: AnimatedSwitcher(
// // //                     duration: const Duration(milliseconds: 500),
// // //                     transitionBuilder: (child, animation) {
// // //                       return ScaleTransition(scale: animation, child: child);
// // //                     },
// // //                     child: isDarkMode
// // //                         ? Row(
// // //                             key: const ValueKey("moon"),
// // //                             children: const [
// // //                               Icon(Icons.brightness_2, color: Colors.yellow),
// // //                               Icon(Icons.star, color: Colors.yellow, size: 12),
// // //                             ],
// // //                           )
// // //                         : Icon(Icons.wb_sunny, color: Colors.amber, key: const ValueKey("sun")),
// // //                   ),
// // //                 ),

// // //                 // Sliding Button
// // //                 AnimatedAlign(
// // //                   duration: const Duration(milliseconds: 500),
// // //                   curve: Curves.easeInOut,
// // //                   alignment: isDarkMode ? Alignment.centerRight : Alignment.centerLeft,
// // //                   child: Container(
// // //                     margin: const EdgeInsets.all(5),
// // //                     width: 40,
// // //                     height: 40,
// // //                     decoration: BoxDecoration(
// // //                       shape: BoxShape.circle,
// // //                       color: isDarkMode ? Colors.white : Colors.black,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }


//*************************************Horizon************************ */

// ListView.builder(
//       scrollDirection: Axis.horizontal,
//       physics: const PageScrollPhysics(), // Smooth scrolling effect
//       itemCount: 1000, // Large number for infinite scrolling effect
//       itemBuilder: (context, index) {
//         final items = [
//         ];
//         return items[index % items.length]; // Looping effect
//       },
//     );
    //******************************* LOOP ******************************** */
    // ListWheelScrollView.useDelegate(
    //   physics: const FixedExtentScrollPhysics(),
    //   itemExtent: 60,
    //   perspective: 0.005,
    //   overAndUnderCenterOpacity: 0.5,
    //   childDelegate: ListWheelChildLoopingListDelegate(
    //     children: [
    //      
    //     ],
    //   ),
    // );
//********************************************** */
    // ListWheelScrollView(
    //   // controller: FixedExtentScrollController(),
    //   // physics: ClampingScrollPhysics(),
    //   perspective: 0.005,
    //   overAndUnderCenterOpacity: 0.5,
    //   itemExtent: 60,

    //   children: [
    //   ],
    // );
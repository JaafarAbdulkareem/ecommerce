import 'dart:io';

Future<bool> checkInternet() async {
  try {
    var result = await InternetAddress.lookup("www.google.com");
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}

// import 'dart:async';
// import 'dart:developer';
// import 'dart:io';
// import 'package:connectivity_plus/connectivity_plus.dart';

// Future<bool> checkInternet() async {
//   try {
//     bool value = false;
//     StreamSubscription<List<ConnectivityResult>> subscription = Connectivity()
//         .onConnectivityChanged
//         .listen((List<ConnectivityResult> element) {
//       if (element.contains(ConnectivityResult.wifi) ||
//           element.contains(ConnectivityResult.mobile)) {
//             log("done");
//         value = true;
//       } else {
//         value = false;
//       }
//     });
//     log(subscription.isPaused.toString());
//     // _streamSubscription.cancel();
//     return value;
//   } on SocketException catch (_) {
//     return false;
//   }
// }

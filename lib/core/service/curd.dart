import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/function/check_internet.dart';
import 'package:flutter/material.dart';

class Curd {
  final Dio _dio = Dio();

  Future<Either<StatusRequest, Map<String, dynamic>>> postData(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      if (await checkInternet()) {
        final response = await _dio.post(
          url,
          data: FormData.fromMap(body),
        );

        if (response.statusCode != null &&
            response.statusCode! >= ConstantScale.statusCode &&
            response.statusCode! <= ConstantScale.statusCodeMax) {
          final data = response.data;
          if (data is Map<String, dynamic>) {
            return right(data);
          } else if (data is String) {
            return right(jsonDecode(data));
          } else {
            return left(StatusRequest.exceptionFailur);
          }
        } else {
          return left(StatusRequest.serverFailur);
        }
      } else {
        return left(StatusRequest.offlineFailur);
      }
    } catch (e) {
      debugPrint('❌ Dio exception in postData: $e');
      return left(StatusRequest.exceptionFailur);
    }
  }
}

// // import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:dartz/dartz.dart';
// import 'package:ecommerce/core/class/status_request.dart';
// import 'package:ecommerce/core/constant/api_key_secret.dart';
// import 'package:ecommerce/core/constant/constant_scale.dart';
// import 'package:ecommerce/core/function/check_internet.dart';
// import 'package:http/http.dart' as http;

// class Curd {
//   Future<Either<StatusRequest, Map<String, dynamic>>> postPayment({
//     required String url,
//     required Map<String, dynamic> body,
//     Map<String, String>? headers,
//   }) async {
//     try {
//       if (await checkInternet()) {
//         var response = await http.post(
//           Uri.parse(url),
//           body: body,
//           headers: headers ??
//               {
//                 'Authorization': 'Bearer ${ApiKeySecret.keySecret}',
//                 'Content-Type': 'application/x-www-form-urlencoded'
//               },
//         );
//         if (response.statusCode >= ConstantScale.statusCode &&
//             response.statusCode <= ConstantScale.statusCodeMax) {
//           //remove and try catch
//           // print("$response : body : ${response.body}");
//           var responseBody = jsonDecode(response.body);

//           return right(responseBody);
//         } else {
//           return left(StatusRequest.serverFailur);
//         }
//       } else {
//         return left(StatusRequest.offlineFailur);
//       }
//     } catch (_) {
//       return left(StatusRequest.exceptionFailur);
//     }
//   }

//   Future<Either<StatusRequest, Map<String, dynamic>>> postData(
//     String url,
//     Map<String, dynamic> body,
//   ) async {
//     try {
//       if (await checkInternet()) {
//         var response = await http.post(
//           Uri.parse(url),
//           body: body,
//         );
//         if (response.statusCode >= ConstantScale.statusCode &&
//             response.statusCode <= ConstantScale.statusCodeMax) {
//           //remove and try catch
//           // print("$response : body : ${response.body}");
//           var responseBody = jsonDecode(response.body);

//           return right(responseBody);
//         } else {
//           return left(StatusRequest.serverFailur);
//         }
//       } else {
//         return left(StatusRequest.offlineFailur);
//       }
//     } catch (_) {
//       return left(StatusRequest.exceptionFailur);
//     }
//   }
// }

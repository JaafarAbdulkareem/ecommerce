import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/class/status_request.dart';
import 'package:ecommerce/core/constant/constant_scale.dart';
import 'package:ecommerce/core/function/check_internet.dart';
import 'package:http/http.dart' as http;

class Curd {
  Future<Either<StatusRequest, Map<String, dynamic>>> postData(
      String url, Map<String, dynamic> body) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(url),
          body: body,
        );
        if (response.statusCode >= ConstantScale.statusCode &&
            response.statusCode <= ConstantScale.statusCodeMax) {
          //remove and try catch
          print("$response : body : ${response.body}");
          var responseBody = jsonDecode(response.body);

          return right(responseBody);
        } else {
          return left(StatusRequest.serverFailur);
        }
      } else {
        return left(StatusRequest.offlineFailur);
      }
    } catch (_) {
      return left(StatusRequest.exceptionFailur);
    }
  }
}

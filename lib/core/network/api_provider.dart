import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  static const String baseUrl = "BASE_URL_HERE/CONSTANTS FILE";

  Future<dynamic> get({required String endPoint}) async {
    var responseJson = {};
    try {
      final Uri methodUrl = Uri.parse(baseUrl + endPoint);
      final response = await http.get(methodUrl);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(
      {required String endPoint, required Map<String, dynamic> params}) async {
    var responseJson = {};
    try {
      final Uri methodUrl = Uri.parse(baseUrl + endPoint);
      final response = await http.post(
        methodUrl,
        body: jsonEncode(params),
        encoding: Encoding.getByName('utf-8'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // 'auth': params['header']
        },
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class CustomException implements Exception {
  final _message;
  final _prefix;

  CustomException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

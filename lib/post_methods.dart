import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

String mobileNumber;

Future<http.Response> requestMethod() async {
  String urlSendPin = 'https://api.infobip.com/2fa/1/pin';
  Object bodySendPin = json.encode({
    "applicationId": "670F3D7D1460D71B77E5D9641804CCF6",
    "messageId": "32F7F7D480311A279D04659EF6D2A220",
    "from": "InfoSMS",
    "to": mobileNumber
  });

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    HttpHeaders.authorizationHeader: 'Basic ###='
  };

  final response =
      await http.post(urlSendPin, body: bodySendPin, headers: headers);
  final responseJson = json.decode(response.body);
  print(responseJson);
  pinId = responseJson['pinId'];
  print(pinId);
  if (responseJson['smsStatus'] == 'MESSAGE_SENT') {
    print('Page with code');
  } else {
    print('Request Error, please try again');
  }
  return response;
}

// PIN validation

String pinCode;
String pinId;

Future<http.Response> pinValidation() async {
  String urlValidation = 'https://api.infobip.com/2fa/1/pin/$pinId/verify';
  Object bodyValidation = json.encode(
      {"applicationId": "670F3D7D1460D71B77E5D9641804CCF6", "pin": '$pinCode'});

  Map<String, String> headers = {
    'Content-type': 'application/json',
    HttpHeaders.authorizationHeader: 'Basic ###='
  };

  final response =
      await http.post(urlValidation, body: bodyValidation, headers: headers);
  final responseJson = json.decode(response.body);
  print(responseJson);
  if (responseJson['verified'] == true) {
    print('Authenticated with success!');
  } else {
    print('The PIN code s wrong!');
  }
  return response;
}

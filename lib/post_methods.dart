import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

String mobileNumber = '';

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
    HttpHeaders.authorizationHeader:
        'Basic bHVpemRjYXN0cm86U3VwcG9ydEA5MTI1MTA='
  };

  final response =
      await http.post(urlSendPin, body: bodySendPin, headers: headers);
  final responseJson = json.decode(response.body);
  print(responseJson);
  return response;
}

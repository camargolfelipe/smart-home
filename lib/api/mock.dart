import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:smartsmart/src/models/mock.dart';

Future readJson() async {
  final String response = await rootBundle.loadString('assets/items.json');

  var jsonMap = json.decode(response);
  final doctorModel = MockModel.fromJson(jsonMap);
  return doctorModel.mock?.devices;
}

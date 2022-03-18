import 'dart:convert';

import 'package:flutter/services.dart';

Future readJson() async {
  final String response = await rootBundle.loadString('assets/items.json');
  final data = await json.decode(response);
  return data;
}

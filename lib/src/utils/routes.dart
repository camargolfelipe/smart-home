import 'package:flutter/material.dart';
import 'package:smartsmart/src/pages/home.dart';

final appRoutes = {
  '/': (context) => HomePage(),
};

//FUNCTIONS
class Routes {
  simple(context, String route) {
    return Navigator.pushNamed(context, route);
  }

  constructed(context, Widget route) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}

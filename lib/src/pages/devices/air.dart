import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class AirPage extends StatefulWidget {
  bool isActive;
  AirPage(this.isActive, {Key? key}) : super(key: key);

  @override
  State<AirPage> createState() => _AirPageState();
}

class _AirPageState extends State<AirPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: mainColor,
            title: Text('TV da Sala',
                style: TextStyle(color: ice, fontSize: 18.0))),
        backgroundColor: mainColor,
        body: Column(
          children: [],
        ));
  }
}

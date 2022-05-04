import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../functions/devices/air.dart';
import '../../utils/colors.dart';

class AirPage extends StatefulWidget {
  bool isActive;
  int description;
  AirPage(this.isActive, this.description, {Key? key}) : super(key: key);

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
            title: Text('Ar Condicionado - Escritório',
                style: TextStyle(color: ice, fontSize: 18.0))),
        backgroundColor: mainColor,
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: SizedBox(
                width: double.infinity,
                child: Lottie.asset(
                  temperature(widget.description),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text('${widget.description.toString()}° C',
                        style: TextStyle(
                            color: ice,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.description += 1;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: thirdColor,
                              radius: 32,
                              child: Text('+',
                                  style: TextStyle(color: ice, fontSize: 24)),
                            ),
                          )),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.description -= 1;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: thirdColor,
                              radius: 32,
                              child: Text(
                                '-',
                                style: TextStyle(color: ice, fontSize: 24),
                              ),
                            ),
                          )),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ));
  }
}

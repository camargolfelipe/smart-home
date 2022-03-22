import 'dart:math';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smartsmart/src/utils/colors.dart';
import 'package:smartsmart/src/utils/strings.dart';

class LightPage extends StatefulWidget {
  bool isActive;
  double intensity;
  LightPage(this.isActive, this.intensity, {Key? key}) : super(key: key);

  @override
  State<LightPage> createState() => _LightPageState();
}

class _LightPageState extends State<LightPage> {
  Strings strings = Strings();
  bool schedule = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: mainColor,
            title: Text('Luz da Sala',
                style: TextStyle(color: ice, fontSize: 18.0))),
        backgroundColor: mainColor,
        body: Column(
          children: [
            Expanded(
                flex: 7,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (widget.isActive) {
                                    widget.isActive = false;
                                    widget.intensity = 0;
                                  } else {
                                    widget.intensity = 10;
                                    widget.isActive = true;
                                  }
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: widget.intensity == 0
                                      ? black
                                      : thirdColor,
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(LineIcons.powerOff,
                                        color: ice, size: 40)),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.2),
                            Row(
                              children: [
                                Text(
                                  strings.schedule,
                                  style: TextStyle(color: ice, fontSize: 14.0),
                                ),
                                Switch(
                                  activeColor: thirdColor,
                                  value: schedule,
                                  onChanged: (value) {
                                    setState(() {
                                      schedule = value;
                                    });
                                  },
                                )
                              ],
                            ),
                            Visibility(
                                visible: schedule,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      strings.time,
                                      style: TextStyle(
                                          color: grey, fontSize: 12.0),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('17:00 - 22:00',
                                          style: TextStyle(
                                              color: ice,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              wordSpacing: 10)),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.transparent,
                            boxShadow: widget.intensity == 0
                                ? []
                                : [
                                    BoxShadow(
                                      color: thirdColorWithWhite,
                                      blurRadius: 80.0,
                                      spreadRadius: widget.intensity / 2.5,
                                    ),
                                  ]),
                        child: Transform.rotate(
                          angle: 180 * pi / 180,
                          child: Icon(LineIcons.lightbulbAlt,
                              size: 120,
                              color: widget.intensity == 0 ? black : ice),
                        ),
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        strings.intensity,
                        style: TextStyle(color: ice, fontSize: 18.0),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: SliderTheme(
                          data: const SliderThemeData(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 6),
                          ),
                          child: Slider(
                            value: widget.intensity,
                            thumbColor: ice,
                            activeColor: thirdColorWithWhite
                                .withOpacity(widget.intensity / 100),
                            max: 100,
                            divisions: 10,
                            label: '${widget.intensity.round().toString()}%',
                            onChanged: (double value) {
                              setState(() {
                                widget.intensity = value;
                              });
                            },
                          )),
                    ),
                  ],
                )),
          ],
        ));
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smartsmart/src/pages/devices/tv.dart';
import 'package:smartsmart/src/pages/home.dart';
import 'package:smartsmart/src/utils/colors.dart';
import 'package:smartsmart/src/utils/routes.dart';

import '../pages/devices/air.dart';
import '../pages/devices/lights.dart';

class HomeBarItens extends StatelessWidget {
  IconData icon;
  String label;
  HomeBarItens(this.icon, this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            size: 16.0,
            color: white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(label, style: TextStyle(color: ice, fontSize: 14.0)),
          ),
        ],
      ),
    );
  }
}

class HomeCameraMonitoration extends StatelessWidget {
  String title;
  String img;
  HomeCameraMonitoration(this.title, this.img, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Container(
                      height: 6.0,
                      width: 8.0,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  Text(title, style: TextStyle(color: grey, fontSize: 10.0)),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                      image: NetworkImage(img), fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeGridItem extends StatefulWidget {
  bool isActive = false;
  String icon;
  String description;
  String type;

  HomeGridItem(this.isActive, this.icon, this.description, this.type,
      {Key? key})
      : super(key: key);

  @override
  State<HomeGridItem> createState() => _HomeGridItemState();
}

class _HomeGridItemState extends State<HomeGridItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          route(context, widget.type, widget.isActive, widget.description);
        },
        child: Container(
          decoration: BoxDecoration(
            color: secondColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.all(16.0),
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                  color: widget.isActive ? thirdColor : mainColor,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: widget.isActive
                      ? [
                          BoxShadow(
                            color: thirdColor,
                            blurRadius: 10.0,
                            spreadRadius: 0.1,
                          ),
                        ]
                      : [],
                ),
              ),
            ),
            icon(widget.icon),
            Align(
                alignment: Alignment.bottomCenter,
                child: description(widget.type, widget.description)),
          ]),
        ),
      ),
    );
  }
}

route(context, type, bool isActive, String description) {
  Routes routes = Routes();
  switch (type) {
    case 'humidifier':
      return routes.constructed(context, HomePage());
    case 'lights':
      return routes.constructed(
          context, LightPage(isActive, double.parse(description)));
    case 'sound':
      return routes.constructed(context, HomePage());
    case 'electronics':
      return routes.constructed(context, HomePage());
    case 'TV':
      return routes.constructed(context, TVPage(isActive));
    case 'thermostat':
      return routes.constructed(context, AirPage(isActive));
    default:
      return routes.constructed(context, HomePage());
  }
}

Widget icon(String icon) {
  switch (icon) {
    case 'sound':
      return Icon(LineIcons.music, color: ice, size: 64.0);
    case 'humidifier':
      return Icon(LineIcons.water, color: ice, size: 64.0);
    case 'lights':
      return Icon(LineIcons.lightbulb, color: ice, size: 64.0);
    case 'TV':
      return Icon(LineIcons.television, color: ice, size: 64.0);
    case 'thermostat':
      return Icon(LineIcons.snowflake, color: ice, size: 64.0);
    default:
      return Icon(LineIcons.television, color: ice, size: 64.0);
  }
}

Widget description(String type, String description) {
  switch (type) {
    case 'humidifier':
    case 'lights':
      return Column(
        children: [
          Text(
            '$description%',
            style: TextStyle(color: grey),
          ),
          SliderTheme(
              data: const SliderThemeData(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
              ),
              child: Slider(
                activeColor: thirdColor,
                thumbColor: ice,
                min: 1.0,
                max: 100.0,
                value: double.parse(description),
                onChanged: (double value) {},
              )),
        ],
      );
    case 'sound':
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description, style: TextStyle(color: grey)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(LineIcons.backward, color: grey),
              Icon(LineIcons.play, color: grey),
              Icon(LineIcons.forward, color: grey),
            ],
          )
        ],
      );
    case 'electronics':
    case 'TV':
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), color: mainColor),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(description, style: TextStyle(color: grey)),
            )),
      );

    case 'thermostat':
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$description C', style: TextStyle(color: grey)),
          ),
          SliderTheme(
              data: const SliderThemeData(
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
              ),
              child: Slider(
                min: 1.0,
                max: 100.0,
                value: double.parse(description),
                onChanged: (double value) {},
              )),
        ],
      );
    default:
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), color: mainColor),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(description, style: TextStyle(color: grey)),
            )),
      );
  }
}

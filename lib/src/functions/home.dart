import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smartsmart/src/pages/devices/lights.dart';
import 'package:smartsmart/src/pages/devices/music.dart';
import 'package:smartsmart/src/pages/devices/tv.dart';
import 'package:smartsmart/src/utils/routes.dart';
import '../pages/devices/air.dart';
import '../pages/home.dart';
import '../utils/colors.dart';

route(context, type, bool isActive, String description) {
  Routes routes = Routes();
  switch (type) {
    case 'humidifier':
      return routes.constructed(context, HomePage());
    case 'lights':
      return routes.constructed(
          context, LightPage(isActive, double.parse(description)));
    case 'sound':
      return routes.constructed(context, MusicPage(description));
    case 'electronics':
      return routes.constructed(context, HomePage());
    case 'tv':
      return routes.constructed(context, TVPage(isActive));
    case 'air':
      return routes.constructed(
          context, AirPage(isActive, int.parse(description)));
    case 'thermostat':
      return routes.constructed(context, HomePage());
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

    case 'tv':
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
    case 'air':
    case 'thermostat':
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), color: mainColor),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('$description° C', style: TextStyle(color: grey)),
            )),
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

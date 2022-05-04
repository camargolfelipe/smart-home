import 'package:flutter/material.dart';
import 'package:smartsmart/src/utils/colors.dart';

class MusicIcons extends StatelessWidget {
  IconData icon;
  Function()? function;
  MusicIcons(this.icon, this.function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: IconButton(
            onPressed: function, icon: Icon(icon, size: 40, color: ice)));
  }
}

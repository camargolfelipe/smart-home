import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TVChannel extends StatelessWidget {
  String lottieAsset;
  Function()? function;
  TVChannel(this.lottieAsset, this.function, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        function;
      },
      child: Lottie.asset(
        lottieAsset,
        repeat: false,
        width: 200,
        height: 200,
        fit: BoxFit.contain,
      ),
    ));
  }
}

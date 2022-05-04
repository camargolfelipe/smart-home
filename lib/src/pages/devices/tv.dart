import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:smartsmart/src/components/tv.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';

class TVPage extends StatefulWidget {
  bool isActive;
  TVPage(this.isActive, {Key? key}) : super(key: key);

  @override
  State<TVPage> createState() => _TVPageState();
}

class _TVPageState extends State<TVPage> {
  Strings strings = Strings();
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
          children: [
            SizedBox(
                width: double.infinity,
                child: Icon(LineIcons.television,
                    color: widget.isActive ? thirdColorWithWhite : ice,
                    size: 240)),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.isActive = !widget.isActive;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: widget.isActive ? thirdColor : black,
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(LineIcons.powerOff, color: ice, size: 40)),
              ),
            ),
            Row(
              children: [
                TVChannel('assets/lottie/tv/netflix.json', () {
                  setState(() {
                    widget.isActive = true;
                  });
                }),
                TVChannel('assets/lottie/tv/prime-video.json', () {
                  setState(() {
                    widget.isActive = true;
                  });
                }),
              ],
            ),
            Text(
              strings.volume,
              style: TextStyle(color: ice, fontSize: 18.0),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: CircleAvatar(
                    backgroundColor: thirdColor,
                    radius: 32,
                    child:
                        Text('+', style: TextStyle(color: ice, fontSize: 24)),
                  )),
                  Expanded(
                      child: CircleAvatar(
                    backgroundColor: thirdColor,
                    radius: 32,
                    child: Text(
                      '-',
                      style: TextStyle(color: ice, fontSize: 24),
                    ),
                  )),
                ],
              ),
            )
          ],
        ));
  }
}

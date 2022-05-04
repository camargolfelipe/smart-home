import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smartsmart/src/utils/colors.dart';
import '../../components/music.dart';

class MusicPage extends StatefulWidget {
  String musicName;
  MusicPage(this.musicName, {Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  var isActive = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: mainColor,
            title:
                Text('Spotify', style: TextStyle(color: ice, fontSize: 18.0))),
        backgroundColor: mainColor,
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  // ignore: prefer_const_constructors
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10)
                      ],
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images.genius.com/b4369987004e17afd31f8d5cf68e91c4.720x720x1.jpg"))),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.musicName,
                          style: TextStyle(
                              color: ice, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 2.0,
                          decoration: BoxDecoration(
                              color: ice,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      Row(
                        children: [
                          MusicIcons(LineIcons.backward, () {}),
                          MusicIcons(
                              isActive ? LineIcons.pause : LineIcons.play, () {
                            setState(() {
                              isActive = !isActive;
                            });
                          }),
                          MusicIcons(LineIcons.forward, () {}),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}

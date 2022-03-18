import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smartsmart/src/components/home.dart';
import 'package:smartsmart/src/utils/colors.dart';
import 'package:smartsmart/src/utils/strings.dart';

import '../../api/mock.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  Strings string = Strings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              color: secondColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Text(
                        string.menu_hello + ', \nLuís Felipe',
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: ice,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          HomeBarItens(
                              FontAwesomeIcons.thermometerThreeQuarters,
                              '23° C'),
                          HomeBarItens(FontAwesomeIcons.water, '76%'),
                          HomeBarItens(FontAwesomeIcons.lock, 'locked'),
                          HomeBarItens(FontAwesomeIcons.wifi, '47 Mb/s'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                HomeCameraMonitoration('Living Room',
                    'https://images.adsttc.com/media/images/5014/01bd/28ba/0d3b/4500/0b8c/slideshow/stringio.jpg?1414576505'),
                HomeCameraMonitoration('Kitchen',
                    'https://i.pinimg.com/originals/64/a4/64/64a46451ce9908ee3183e2245a273713.jpg'),
                HomeCameraMonitoration('Bedroom',
                    'https://us.123rf.com/450wm/piovesempre/piovesempre1903/piovesempre190300023/118204408-modern-living-room-with-designer-sofa-and-coffee-table-window-with-view-nobody-inside.jpg?ver=6'),
              ],
            ),
            const Divider(color: grey),
            FutureBuilder(
                future: readJson(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HomeGrid(snapshot);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })
          ],
        ));
  }
}

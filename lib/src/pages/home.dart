import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smartsmart/src/components/home.dart';
import 'package:smartsmart/src/models/mock.dart';
import 'package:smartsmart/src/utils/colors.dart';
import 'package:smartsmart/src/utils/strings.dart';

import '../../api/mock.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Strings string = Strings();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                          style: TextStyle(
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
                            HomeBarItens(LineIcons.thermometer, '23° C'),
                            HomeBarItens(LineIcons.water, '76%'),
                            HomeBarItens(LineIcons.lock, 'locked'),
                            HomeBarItens(LineIcons.wifi, '47 Mb/s'),
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
              Divider(color: grey),
              TabBar(
                indicatorColor: thirdColor,
                tabs: const [
                  Tab(text: 'All'),
                  Tab(text: 'Hall'),
                  Tab(text: 'Bedroom'),
                  Tab(
                    text: 'Bathroom',
                  ),
                ],
              ),
              FutureBuilder(
                  future: readJson(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Devices>? devices = snapshot.data as List<Devices>?;
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          padding: const EdgeInsets.all(8.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: devices?.length,
                          itemBuilder: (context, index) {
                            Devices data = devices![index];
                            return HomeGridItem(
                                data.active as bool,
                                data.icon as String,
                                data.description as String,
                                data.type as String);
                          });
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
            ],
          )),
    );
  }
}

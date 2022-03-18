// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:smartsmart/src/utils/colors.dart';

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
            size: 12.0,
            color: white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child:
                Text(label, style: const TextStyle(color: ice, fontSize: 14.0)),
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
                  Text(title,
                      style: const TextStyle(color: grey, fontSize: 10.0)),
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

class HomeGrid extends StatelessWidget {
  AsyncSnapshot<Object?> snapshot;
  HomeGrid(this.snapshot, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = snapshot.data;
    return GridView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        padding: const EdgeInsets.all(8.0),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 1,
        itemBuilder: (context, index) {
          bool isActive = index != 1;
          return Text(data.toString());
          // HomeGridItem(isActive);
        });
  }
}

class HomeGridItem extends StatelessWidget {
  bool isActive = false;
  HomeGridItem(this.isActive, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
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
                color: isActive ? thirdColor : mainColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow: isActive
                    ? [
                        const BoxShadow(
                          color: thirdColor,
                          blurRadius: 10.0,
                          spreadRadius: 0.1,
                          offset: Offset(0, 0),
                        ),
                      ]
                    : [],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

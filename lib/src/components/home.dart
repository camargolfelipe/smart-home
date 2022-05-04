// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartsmart/src/functions/home.dart';
import 'package:smartsmart/src/utils/colors.dart';

class HomeBarItens extends StatelessWidget {
  IconData icon;
  String label;
  Function()? function;
  HomeBarItens(this.icon, this.label, {this.function, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
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

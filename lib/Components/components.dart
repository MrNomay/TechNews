// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/texts.dart';

class BottomSheetImage extends StatefulWidget {
  BottomSheetImage({Key? key, required this.imageurl, required this.title})
      : super(key: key);
  String imageurl, title;
  @override
  State<BottomSheetImage> createState() => _BottomSheetImageState();
}

class _BottomSheetImageState extends State<BottomSheetImage> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h / 3,
      width: w,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 1,
              child: Container(
                height: h / 3,
                width: w,
                foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Appcolors.black,
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    image: DecorationImage(
                        image: NetworkImage(widget.imageurl),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              bottom: 5,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: w / 1.5,
                child: modifiedtext(
                    text: widget.title, size: 14, color: Appcolors.white),
              ))
        ],
      ),
    );
  }
}

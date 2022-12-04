// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:tech_news/Components/components.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/texts.dart';
import 'package:url_launcher/url_launcher.dart';

void NewsBottomSheet(BuildContext context, String imageurl, String title,
    String time, String description, String url) {
  showModalBottomSheet(
      backgroundColor: Appcolors.bgcolor,
      elevation: 20,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: ((context) {
        return BottomsheetLayout(
            imageurl: imageurl,
            title: title,
            time: time,
            description: description,
            url: url);
      }));
}

class BottomsheetLayout extends StatelessWidget {
  BottomsheetLayout(
      {Key? key,
      required this.imageurl,
      required this.title,
      required this.time,
      required this.description,
      required this.url})
      : super(key: key);
  String imageurl, title, time, description, url;
  Future<void> launch(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          color: Appcolors.bgcolor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetImage(imageurl: imageurl, title: title),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(10),
                child: modifiedtext(
                    text: description, size: 12, color: Appcolors.lightwhite)),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: TextButton(
                    onPressed: () {
                      launch(Uri.parse(url));
                    },
                    child: modifiedtext(
                        text: 'More Details',
                        size: 12,
                        color: Appcolors.primary))),
          ),
        ],
      ),
    );
  }
}

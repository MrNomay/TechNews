// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_news/Components/bottomsheet.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/texts.dart';

class NewsBox extends StatelessWidget {
  NewsBox(
      {Key? key,
      required this.imageurl,
      required this.title,
      required this.time,
      required this.description,
      required this.url})
      : super(key: key);

  String imageurl, title, time, description, url;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        InkWell(
            onTap: () {
              NewsBottomSheet(context, imageurl, title, time, description, url);
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              width: w,
              color: Appcolors.black,
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: imageurl,
                    imageBuilder: (context, imageProvider) => Container(
                      height: h / 10,
                      width: w / 4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                    placeholder: (context, url) => Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: CircularProgressIndicator(
                          color: Appcolors.primary,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    width: w / 1.6,
                    height: h / 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        modifiedtext(
                            text: title, size: 14, color: Appcolors.lightwhite),
                        modifiedtext(
                            text: time, size: 10, color: Appcolors.lightwhite),
                      ],
                    ),
                  )
                ],
              ),
            )),
        Divider(
          thickness: 2,
          indent: w / 20,
          endIndent: w / 20,
        )
      ],
    );
  }
}

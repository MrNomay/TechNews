// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_news/Backend/provider.dart';
import 'package:tech_news/Components/bottomsheet.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/texts.dart';

class NewsBox extends StatefulWidget {
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
  State<NewsBox> createState() => _NewsBoxState();
}

class _NewsBoxState extends State<NewsBox> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    final provider = Provider.of<Notifier>(context);
    return Column(
      children: [
        InkWell(
            onTap: () {
              NewsBottomSheet(context, widget.imageurl, widget.title,
                  widget.time, widget.description, widget.url);
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              width: w,
              color: Appcolors.black,
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.imageurl,
                    imageBuilder: (context, imageProvider) => Container(
                      height: h / 12,
                      width: w / 6,
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
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      size: w / 6,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    width: w / 2,
                    height: h / 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        modifiedtext(
                            text: widget.title,
                            size: 14,
                            color: Appcolors.lightwhite),
                        modifiedtext(
                            text: widget.time,
                            size: 10,
                            color: Appcolors.lightwhite),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  IconButton(
                      onPressed: () {
                        provider.addingfavs(NewsBox(
                          imageurl: widget.imageurl,
                          title: widget.title,
                          time: widget.time,
                          description: widget.description,
                          url: widget.url,
                        ));
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: provider.existed(NewsBox(
                          imageurl: widget.imageurl,
                          title: widget.title,
                          time: widget.time,
                          description: widget.description,
                          url: widget.url,
                        ))
                            ? const Color.fromARGB(255, 204, 2, 2)
                            : Colors.white,
                        size: 20,
                      )),
                  const Spacer(
                    flex: 1,
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

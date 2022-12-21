// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tech_news/pages/fav.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/texts.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  const appbar({Key? key})
      : preferredSize = const Size.fromHeight(50),
        super(key: key);
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Appcolors.black,
      title: SizedBox(
        height: MediaQuery.of(context).size.height / 16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 1,
            ),
            boldtext(text: 'Tech', size: 22, color: Appcolors.primary),
            modifiedtext(text: 'News', size: 22, color: Appcolors.lightwhite),
            const Spacer(
              flex: 1,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Favs()));
                },
                icon: Icon(
                  Icons.favorite,
                  color: Appcolors.primary,
                ))
          ],
        ),
      ),
    );
  }
}

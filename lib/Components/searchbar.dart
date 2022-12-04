import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_news/Backend/functions.dart';
import 'package:tech_news/utils/colors.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({Key? key}) : super(key: key);
  static TextEditingController searchcontroller =
      TextEditingController(text: '');
  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        const Spacer(
          flex: 5,
        ),
        Container(
          height: h / 14,
          width: w / 1.4,
          padding: EdgeInsets.only(left: w / 32),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Appcolors.darkgrey),
          child: Center(
            child: TextField(
              controller: Searchbar.searchcontroller,
              cursorColor: Appcolors.primary,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter a word or phrase to search',
                  hintStyle: GoogleFonts.lato(
                      fontSize: 14, color: Appcolors.lightwhite)),
            ),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Container(
          height: h / 14,
          width: w / 8,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Appcolors.darkgrey),
          child: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                fetchnews();
              },
              icon: Icon(
                Icons.search,
                color: Appcolors.white,
              )),
        ),
        const Spacer(
          flex: 5,
        )
      ],
    );
  }
}

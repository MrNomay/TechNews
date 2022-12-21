import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_news/Backend/provider.dart';
import 'package:tech_news/Components/newstile.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/texts.dart';

class Favs extends StatefulWidget {
  const Favs({super.key});

  @override
  State<Favs> createState() => _FavsState();
}

class _FavsState extends State<Favs> {
  @override
  Widget build(BuildContext context) {
    final provder = Provider.of<Notifier>(context).favs;
    return Scaffold(
      backgroundColor: Appcolors.black,
      appBar: AppBar(
          title: boldtext(text: 'Favorites', size: 22, color: Appcolors.white)),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: provder.length,
            itemBuilder: (context, index) {
              return NewsBox(
                  imageurl: provder[index].imageurl,
                  title: provder[index].title,
                  time: provder[index].time,
                  description: provder[index].description,
                  url: provder[index].url);
            }),
      ),
    );
  }
}

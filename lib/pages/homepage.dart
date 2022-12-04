// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:tech_news/Backend/functions.dart';
import 'package:tech_news/Components/appbar.dart';
import 'package:tech_news/Components/newstile.dart';
import 'package:tech_news/Components/searchbar.dart';
import 'package:tech_news/utils/colors.dart';
import 'package:tech_news/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    // var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Appcolors.black,
      appBar: const appbar(),
      body: Column(
        children: [
          const Searchbar(),
          Expanded(
            child: SizedBox(
              width: w,
              child: FutureBuilder<List>(
                  future: fetchnews(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            return NewsBox(
                                imageurl:
                                    snapshot.data![index]['urlToImage'] != null
                                        ? snapshot.data![index]['urlToImage']
                                        : constImage.imageurl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]
                                        ['description']
                                    .toString(),
                                url: snapshot.data![index]['url']);
                          }));
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.error}'),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Appcolors.primary,
                        ),
                      );
                    }
                    return Center(
                      child:
                          CircularProgressIndicator(color: Appcolors.primary),
                    );
                  })),
            ),
          )
        ],
      ),
    );
  }
}

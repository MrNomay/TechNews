// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tech_news/Components/searchbar.dart';
import 'package:tech_news/utils/apikey.dart';

Future<List> fetchnews() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=technology&pagesize=100&apiKey=' +
          apikey.key +
          '&q=' +
          Searchbar.searchcontroller.text));

  Map result = jsonDecode(response.body);
  print('Got results');

  return result['articles'];
}

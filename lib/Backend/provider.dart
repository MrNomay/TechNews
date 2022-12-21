import 'package:flutter/material.dart';
import 'package:tech_news/Components/newstile.dart';

class Notifier extends ChangeNotifier {
  List<NewsBox> favs = [];
  void addingfavs(NewsBox element) {
    final exists = favs.contains(element);
    if (exists) {
      favs.remove(element);
    } else {
      favs.add(element);
    }
    print(exists.toString());
    notifyListeners();
  }

  bool existed(NewsBox element) {
    final existed = favs.contains(element);
    return existed;
  }
}


  // String Str = '';
  // Notifier({required this.Str});
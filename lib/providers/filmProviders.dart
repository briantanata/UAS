import 'package:dsc/models/filmModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FilmProvider with ChangeNotifier {
  List<FilmItem> _filmItemList = [];

  List<FilmItem> get FilmList => _filmItemList;

  void addFavorite(FilmItem todo) {
    print(todo.genre);
    _filmItemList.add(todo);
    notifyListeners();
  }

  void removeFavorite(FilmItem todo) {
    print(todo);
    _filmItemList.remove(todo);
    notifyListeners();
  }
}

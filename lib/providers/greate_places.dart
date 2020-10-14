import 'dart:io';

import 'package:GreatPlaces/helpers/db_helper.dart';
import 'package:GreatPlaces/model/place.dart';
import 'package:flutter/cupertino.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get place {
    return [..._items];
  }

  void addPlace(String title, File pickedFile) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        name: title,
        location: null,
        image: pickedFile);

    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert("places", {
      "id": newPlace.id,
      "title": newPlace.name,
      "image": newPlace.image.path
    });
  }
}

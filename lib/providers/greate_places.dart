import 'dart:io';

import 'package:GreatPlaces/helpers/db_helper.dart';
import 'package:GreatPlaces/model/place.dart';
import 'package:flutter/cupertino.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get place {
    return [..._items];
  }

  Future<void> addPlace(
      String title, File pickedFile, PlaceLocation pickedLocation) async {
    final newPlace = Place(
        id: DateTime.now().toString(),
        name: title,
        location: pickedLocation,
        image: pickedFile);

    _items.add(newPlace);
    notifyListeners();
    try {
      await DBHelper.insert("user_place", {
        "id": newPlace.id,
        "title": newPlace.name,
        "image": newPlace.image.path,
        "loc_lat": newPlace.location.lat,
        "loc_lng": newPlace.location.lon,
        "address": newPlace.location.address
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> getPlaces() async {
    final placesData = await DBHelper.getData("user_place");

    _items = placesData
        .map((e) => Place(
            id: e['id'],
            name: e['title'],
            location: PlaceLocation(
                lat: e['loc_lat'], lon: e['loc_lon'], address: e["address"]),
            image: File(e['image'])))
        .toList();
    notifyListeners();
  }
}

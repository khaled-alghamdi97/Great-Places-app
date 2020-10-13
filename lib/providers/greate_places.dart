import 'package:GreatPlaces/model/place.dart';
import 'package:flutter/cupertino.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get place {
    return [..._items];
  }
}

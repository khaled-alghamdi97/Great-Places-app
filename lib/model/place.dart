import 'dart:io';

import 'package:flutter/cupertino.dart';

class PlaceLocation {
  final double lat;
  final double lon;
  final String address;

  PlaceLocation({@required this.lat, @required this.lon, this.address});
}

class Place {
  final String id;
  final String name;
  final PlaceLocation location;
  final File image;
  Place(
      {@required this.id,
      @required this.name,
      @required this.location,
      @required this.image});
}

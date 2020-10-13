import 'package:GreatPlaces/pages/add_places_page.dart';
import 'package:GreatPlaces/pages/places_list_page.dart';
import 'package:GreatPlaces/providers/greate_places.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PlacesList(),
        routes: {AddPlacesPage.routName: (ctx) => AddPlacesPage()},
      ),
    );
  }
}

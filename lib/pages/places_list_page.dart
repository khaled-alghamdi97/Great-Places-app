import '../pages/add_places_page.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Greate Places"),
        actions: [
          FlatButton(
              onPressed: () {},
              child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AddPlacesPage.routName);
                  }))
        ],
      ),
      body: Center(
        child: Text("page list screen"),
      ),
    );
  }
}

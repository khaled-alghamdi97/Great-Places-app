import 'package:GreatPlaces/providers/greate_places.dart';
import 'package:provider/provider.dart';

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
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false).getPlaces(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<GreatPlaces>(
                      child: Center(
                        child: Text("there is no place taken yet"),
                      ),
                      builder: (ctx, value, ch) => value.place.length <= 0
                          ? ch
                          : ListView.builder(
                              itemCount: value.place.length,
                              itemBuilder: (context, index) => ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(value.place[index].image),
                                ),
                                title: Text(value.place[index].name),
                              ),
                            ),
                    ),
        ));
  }
}

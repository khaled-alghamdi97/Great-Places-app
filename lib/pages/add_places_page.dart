import 'dart:io';

import 'package:GreatPlaces/providers/greate_places.dart';
import 'package:GreatPlaces/widgets/image_input.dart';
import 'package:GreatPlaces/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPlacesPage extends StatefulWidget {
  static const routName = "/add-place-page";

  @override
  _AddPlacesPageState createState() => _AddPlacesPageState();
}

class _AddPlacesPageState extends State<AddPlacesPage> {
  var _titleTextController = TextEditingController();
  File pickedImage;

  void _selectImage(File chosenImage) {
    pickedImage = chosenImage;
  }

  void _addPlace() {
    if (_titleTextController.text.isEmpty || pickedImage == null) {
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleTextController.text, pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Place"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: _titleTextController,
                ),
                SizedBox(
                  height: 10,
                ),
                ImageInput(_selectImage),
                SizedBox(
                  height: 10,
                ),
                LocationInput()
              ],
            )),
            RaisedButton(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: _addPlace,
              child: Text("Add place"),
              color: Theme.of(context).accentColor,
            )
          ],
        ),
      ),
    );
  }
}

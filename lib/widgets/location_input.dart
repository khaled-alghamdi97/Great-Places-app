import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _locationImagePreview;

  Future<void> _getCurrentLocation() async {
    final locationData = await Location().getLocation();

    print(locationData.latitude);
    print(locationData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 170,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _locationImagePreview == null
              ? Center(
                  child: Text("no location has been selected yet"),
                )
              : Image.network(_locationImagePreview),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
                textColor: Theme.of(context).primaryColor,
                onPressed: _getCurrentLocation,
                icon: Icon(Icons.location_on),
                label: Text("Current Location")),
            FlatButton.icon(
                textColor: Theme.of(context).primaryColor,
                onPressed: () {},
                icon: Icon(Icons.map),
                label: Text("Select On map"))
          ],
        )
      ],
    );
  }
}

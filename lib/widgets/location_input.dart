import 'package:GreatPlaces/helpers/location_helper.dart';
import 'package:GreatPlaces/model/place.dart';
import 'package:GreatPlaces/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
  final Function selectAlocation;

  LocationInput(this.selectAlocation);
}

class _LocationInputState extends State<LocationInput> {
  String _locationImagePreview;

  Future<void> _showLocationPreviewAndSetAddress(double lat, double lon) async {
    final locationUrl = LoacationHelper.getImagePreviewUrl(lat: lat, lon: lon);

    setState(() {
      _locationImagePreview = locationUrl;
    });

    final address = await LoacationHelper.getLoactionAddress(lat, lon);

    widget.selectAlocation(PlaceLocation(lat: lat, lon: lon, address: address));
  }

  Future<void> _getCurrentLocation() async {
    final locationData = await Location().getLocation();
    _showLocationPreviewAndSetAddress(
        locationData.latitude, locationData.longitude);
  }

  Future<void> _selectMapLocation() async {
    final selectedLocation =
        await Navigator.of(context).push<LatLng>(MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => MapPgae(
        isSelected: true,
      ),
    ));

    if (selectedLocation == null) {
      return;
    }
    _showLocationPreviewAndSetAddress(
        selectedLocation.latitude, selectedLocation.longitude);
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
              : Image.network(
                  _locationImagePreview,
                  fit: BoxFit.cover,
                ),
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
                onPressed: _selectMapLocation,
                icon: Icon(Icons.map),
                label: Text("Select On map"))
          ],
        )
      ],
    );
  }
}

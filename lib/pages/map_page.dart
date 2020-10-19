import 'package:GreatPlaces/model/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPgae extends StatefulWidget {
  @override
  _MapPgaeState createState() => _MapPgaeState();

  final PlaceLocation initialPostion;
  final bool isSelected;

  MapPgae(
      {this.initialPostion =
          const PlaceLocation(lat: 24.6833429675, lon: 46.687399627),
      this.isSelected = false});
}

class _MapPgaeState extends State<MapPgae> {
  LatLng _pickedPostion;

  Future<void> _selectApostion(LatLng postion) {
    setState(() {
      _pickedPostion = postion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        actions: [
          if (widget.isSelected)
            IconButton(
              icon: Icon(Icons.check),
              onPressed: _pickedPostion == null
                  ? null
                  : () => Navigator.of(context).pop(_pickedPostion),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target:
                LatLng(widget.initialPostion.lat, widget.initialPostion.lon),
            zoom: 16),
        onTap: _selectApostion,
        markers: _pickedPostion == null
            ? null
            : {Marker(markerId: MarkerId("m1"), position: _pickedPostion)},
      ),
    );
  }
}

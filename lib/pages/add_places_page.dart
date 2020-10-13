import 'package:flutter/material.dart';

class AddPlacesPage extends StatelessWidget {
  static const routName = "/add-place-page";

  var _titleTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Place"),
      ),
      body: Column(
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
              )
            ],
          )),
          RaisedButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {},
            child: Text("Add place"),
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }
}

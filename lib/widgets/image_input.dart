import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();

  final Function selectAnImage;
  ImageInput(this.selectAnImage);
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  Future<void> _pickAnImage() async {
    final imagePicker = ImagePicker();

    final image =
        await imagePicker.getImage(source: ImageSource.camera, maxWidth: 600);
    if (image == null) {
      return;
    }

    final imageFile = File(image.path);

    setState(() {
      _storedImage = imageFile;
    });

    final appDocDir = await sysPath.getApplicationDocumentsDirectory();

    final fileName = path.basename(imageFile.path);

    final imagePicked = await imageFile.copy("${appDocDir.path}/${fileName}");
    widget.selectAnImage(imagePicked);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: _storedImage != null
            ? Image.file(
                _storedImage,
                fit: BoxFit.cover,
                width: double.infinity,
              )
            : Text(
                "no image has been picked yet",
                textAlign: TextAlign.center,
              ),
        alignment: Alignment.center,
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
        child: FlatButton.icon(
            textColor: Theme.of(context).primaryColor,
            onPressed: _pickAnImage,
            label: Text(
              "Add a picture",
            ),
            icon: Icon(Icons.camera)),
      )
    ]);
  }
}

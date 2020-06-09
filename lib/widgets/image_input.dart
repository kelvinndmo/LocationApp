import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput({Key key, this.onSelectImage}) : super(key: key);
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;
  final picker = ImagePicker();

  Future<void> _takePicture() async {
    final ImageFile =
        await picker.getImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
      _storedImage = File(ImageFile.path);
    });

    final appDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(File(ImageFile.path).path);
    final savedImage =
        await File(ImageFile.path).copy('${appDir.path}/$fileName}');

    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          child: _storedImage != null
              ? Image.file(_storedImage,
                  fit: BoxFit.cover, width: double.infinity)
              : Text("No Image Taken"),
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: Border.all(width: 1), color: Colors.grey),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: FlatButton.icon(
          icon: Icon(Icons.camera),
          onPressed: _takePicture,
          label: Text("Take Picture"),
          textColor: Theme.of(context).primaryColor,
        ))
      ],
    );
  }
}

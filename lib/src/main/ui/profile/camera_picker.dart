import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPickerWidget  {
  dynamic getImageFile;
  ImagePicker picker;
  var pickedFile;
  BuildContext context;
  CameraPickerWidget({ @required this.context,this.getImageFile}){
    _showOptions(context);
     picker = ImagePicker();
  }

  Future _showPhotoLibrary(bool isCamera) async {
    if (isCamera) {
      pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight: 1062.0,
        maxWidth: 1500.0,
      );
    } else {
      pickedFile = await picker.getImage(
          source: ImageSource.gallery, maxHeight: 1062.0, maxWidth: 1500.0);
    }
    getImageFile(File(pickedFile.path));
  }


  void _showOptions(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
                height: 150,
                child: Column(children: <Widget>[
                  ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        _showPhotoLibrary(true);
                      },
                      leading: Icon(Icons.photo_camera),
                      title: Text("Take a picture from camera")),
                  ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        _showPhotoLibrary(false);
                      },
                      leading: Icon(Icons.photo_library),
                      title: Text("Choose from photo library"))
                ]));
          });
    }

}

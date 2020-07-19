import 'dart:io';
import 'dart:ui';

import 'package:digitalkaimur/src/main/ui/widgets/dialog_zoom.dart';
import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:digitalkaimur/src/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

import 'text_widget.dart';

class AddImageMultiple extends StatefulWidget {
  final Function function;
  AddImageMultiple({Key key, this.function}) : super(key: key);

  @override
  _AddImageMultipleState createState() => _AddImageMultipleState();
}

class _AddImageMultipleState extends State<AddImageMultiple> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  ScrollController _scrollController = new ScrollController();

  List<File> _items = [];
  File _image;
  final picker = ImagePicker();
  bool isHide1 = true;
  bool isHide2 = false;
  var pickedFile;

  var maxWidth=1000.0;
  var maxHeight=500.0;


  Future _showPhotoLibrary(bool isCamera) async {
    if (isCamera) {
      pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxHeight:maxHeight,
        maxWidth: maxWidth,
      );
    } else {
      pickedFile = await picker.getImage(
          source: ImageSource.gallery, maxHeight: maxHeight, maxWidth: maxWidth);
    }
    setState(() {
      _image = File(pickedFile.path);
      _addItem(_items);
      widget.function(_items);
     // RegistrationFormWidget().getAllFilePath(_items,this);
    });

  }



  void _clearAllItems() {
    for (var i = 0; i <= _items.length - 1; i++) {
      _key.currentState.removeItem(0, (BuildContext context, Animation<double> animation) {
            return Container();
          });
    }
    _items.clear();
    isHide1 = true;
    isHide2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
              children: <Widget>[
                Visibility(
                    maintainSize: false,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: isHide1,
                    child: uploadPlaceHolderImage()),
                Visibility(
                    maintainSize: false,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: isHide2,
                    child: uploadImage()),
              ],
            );
  }

  Widget uploadImage() {
    return Container(
        width: double.infinity,
        height: 140.0,
        child: Row(children: <Widget>[
          addGestureDetector(),
          Expanded(child: getListImage())
        ]),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )));
  }

  Widget uploadPlaceHolderImage() {
    return Container(
        width: double.infinity,
        height: 140.0,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextWidget(title: "Add Photos", isBold: true),
              RaisedButton.icon(
                onPressed: () => {_openBottomDialog(context)},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                label: Text(
                  'Photos  ',
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                textColor: Colors.white,
                splashColor: Colors.red,
                color: Colors.grey[500],
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )));
  }

  Widget addGestureDetector() {
    return GestureDetector(
        onTap: () => {_openBottomDialog(context)},
        child: Container(
          margin: EdgeInsets.all(8.0),
          alignment: Alignment.center,
          width: 120.0,
          height: 120.0,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add_a_photo,
                    size: 32.0,
                    color: Colors.white,
                  ),
                  TextWidget(
                    title: 'Add Photos',
                    color: Colors.white,
                    isBold: true,
                  )
                ],
              )),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blueAccent,
            ),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                  offset: new Offset(1.0, 1.0))
            ],
          ),
        ));
  }

  Widget getListImage() {
    return AnimatedList(
        scrollDirection: Axis.horizontal,
        key: _key,
        controller: _scrollController,
        shrinkWrap: true,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return InkWell(
             splashColor: Colors.cyanAccent,
              onTap: () {
                dialogZoomImage(context,_items[index]);
              },
              child: _buildItem(_items[index], animation, index));
        });
  }


  //-----------------
  Widget _buildItem(File item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.horizontal,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(8.0),
          width: 120.0,
          height: 120.0,
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                removeItem(index);
              },
              icon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueAccent,
              ),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.0,
                    offset: new Offset(1.0, 1.0))
              ],
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: item == null ? Text("") : FileImage(item))),
        ),
      ),
    );
  }

  void removeItem(int index) {
    setState(() {
      File removeItem = _items.removeAt(index);
      AnimatedListRemovedItemBuilder builder = (context, animation) {
        return _buildItem(removeItem, animation, index);
      };
      _key.currentState.removeItem(index, builder);

      if (_items.length > 0) {
        isHide1 = false;
        isHide2 = true;
      } else {
        isHide1 = true;
        isHide2 = false;
      }
    });
  }

  void _addItem(_items) {
    setState(() {
      int i = _items.length > 0 ? _items.length : 0;
      _items.add(_image);
      _key.currentState.insertItem(i);
      if (_items.length > 0) {
        isHide1 = false;
        isHide2 = true;
      }
    });
    _scrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 1500), curve: Curves.easeOut);
  }

  void _openBottomDialog(BuildContext context) {
    if (_items.length > 4) {
      Global.toast(AppString.bottomDialog);
    } else {
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
}

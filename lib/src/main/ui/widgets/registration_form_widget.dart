import 'dart:io';

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/repositories/store_repository.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/textfield_widget.dart';
import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:digitalkaimur/src/res/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';

import 'add_mutiple_photos.dart';
import 'button_widget.dart';

class RegistrationFormWidget extends StatefulWidget {
  final String vid,cid,cname;
  RegistrationFormWidget({Key key,this.vid,this.cid,this.cname}):super(key:key);


  @override
  _RegistrationFormWidgetState createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends State<RegistrationFormWidget> {
  LocationResult _pickedLocation;
  String color = "FFFFFS";
  bool isLoading = false;
  StoreRespository _repository;
  List<File> files = [];


  _createFun(_items) {
    setState(() {
      files=_items;
    });

  }

  @override
  void initState() {
    super.initState();
    _repository = StoreRespository(context);
  }

  var _editStoreName = TextEditingController();
  var _editStoreEmail = TextEditingController();
  var _editStoreMobile = TextEditingController();

  var _editStoreAddress = TextEditingController();
  var _editStoreNearBy = TextEditingController();
  var _editStorePincode = TextEditingController();

  var _editOwnerName = TextEditingController();
  var _editOwnerEmail = TextEditingController();
  var _editOwnerMobile = TextEditingController();

  _handleOnSubmit() {
    var name = _editStoreName.text.toString();
    var email = _editStoreEmail.text.toString();
    var mob = _editStoreMobile.text.toString();
    var add = _editStoreAddress.text.toString();
    var near = _editStoreNearBy.text.toString();
    var zip = _editStorePincode.text.toString();
    var oname = _editOwnerName.text.toString();
    var oemail = _editOwnerEmail.text.toString();
    var omob = _editOwnerMobile.text.toString();
    double lat = _pickedLocation?.latLng?.latitude;
    double lng = _pickedLocation?.latLng?.longitude;

    if (name.isEmpty) {
      Global.toast("Please enter store name");
    } else if (email.isEmpty) {
      Global.toast("Please enter store email");
    } else if (mob.isEmpty) {
      Global.toast("Please enter mobile");
    } else if (mob.length != 10) {
      Global.toast("Please enter valid mobile");
    } else if (add.isEmpty) {
      Global.toast("Please enter address");
    } else if (near.isEmpty) {
      Global.toast("Please enter near by address");
    } else if (zip.isEmpty) {
      Global.toast("Please enter pin code");
    } else if (oname.isEmpty) {
      Global.toast("Please enter owner name");
    } else if (oemail.isEmpty) {
      Global.toast("Please enter owner email");
    } else if (omob.isEmpty) {
      Global.toast("Please enter owner mobile");
    } else if (files.length == 0) {
        Global.toast("Please upload at least one photo");
      }
    else {
      setState(() {
        Global.hideKeyboard();
        isLoading = true;
      });

      _repository.storeRegister(files, [
        widget.cid,
        widget.vid,
        name,
        email,
        mob,
        color,
        lat??0.0.toString(),
        lng??0.0.toString(),
        add,
        near,
        zip,
        oname,
        omob,
        oemail
      ]).then((value) {
        setState(() {
          isLoading = false;
          if (value) {
           // Global.navigateToHome(context);
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return inputWidget();
  }

  Widget inputWidget() {
    return SingleChildScrollView(
      child: Wrap(
        alignment: WrapAlignment.start,
        children: [
          AddImageMultiple(function: _createFun,),
          _setContent(),
          _tile1(),
          _tile2(),
          _tile3(),
          ButtonWidget(
            title: 'Sumbit',
            onPressed: _handleOnSubmit,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _setContent() {
    return  Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(title: 'Store Registration No',left: 20,right: 10),
                  TextWidget(
                    title: '#${widget?.vid??'xxxx'}',
                    color: Colors.blueAccent,
                    fontSize: 14.0,
                    ls: 1.6
                      ,left: 20,right: 10,top: 5,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 10),
                    child: RichText(
                      text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            spanDecoration('Store Category: ', Colors.grey),
                            spanDecoration(widget?.cname??'', Colors.blueAccent)
                          ]),
                    ),
                  ),
                ],
              ),
            );
  }

  TextSpan spanDecoration(msg, Color color) {
    return TextSpan(
        text: msg,
        style: TextStyle(
          fontFamily: AppFonts.font,
          fontWeight: FontWeight.w100,
          letterSpacing: 1,
          color: color,
          decoration: TextDecoration.none,
          fontSize: 14,
        ));
  }

  Widget _tile1() {
    return Card(
      margin: EdgeInsets.only(left: 8, right: 8,bottom: 10),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 4,
      child: Padding(
          padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0, bottom: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                title: 'For Store',
                color: Colors.blue,
              ),
              SizedBox(height: 13.0),
              TextFieldWidget(
                  hintText: "Enter store name",
                  controller: _editStoreName,
                  letterSpacing: 1.0,
                  minLine: 1),
              SizedBox(height: 15.0),
              TextFieldWidget(
                  hintText: "Enter store email id",
                  controller: _editStoreEmail,
                  letterSpacing: 1.0,
                  minLine: 1),
              SizedBox(height: 15.0),
              TextFieldWidget(
                  hintText: "Enter store mobile number",
                  controller: _editStoreMobile,
                  maxLength: 10,
                  letterSpacing: 2.0,
                  color: Colors.white,
                  keyboardType: TextInputType.number),
              ButtonWidget(
                title: 'Choose shop color',
                onPressed: () {},
                color: Colors.blue,
              ),
            ],
          )),
    );
  }

  Widget _tile2() {
    return Card(
        margin: EdgeInsets.only(left: 8, right: 8,bottom: 10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 4,
        child: Padding(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 15.0, bottom: 25.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    title: 'For Address',
                    color: Colors.blue,
                  ),
                  ButtonWidget(
                    title: 'Add Store Location',
                    onPressed: _addLocation,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 13.0),
                  TextFieldWidget(
                      hintText: "Enter store address",
                      controller: _editStoreAddress,
                      letterSpacing: 1.0,
                      minLine: 3),
                  SizedBox(height: 13.0),
                  TextFieldWidget(
                      hintText: "Enter store near by",
                      controller: _editStoreNearBy,
                      letterSpacing: 1.0,
                      minLine: 1),
                  SizedBox(height: 13.0),
                  TextFieldWidget(
                      hintText: "Enter pin code",
                      controller: _editStorePincode,
                      maxLength: 6,
                      letterSpacing: 2.0,
                      color: Colors.white,
                      keyboardType: TextInputType.number),
                ])));
  }

  Widget _tile3() {
    return Card(
        margin: EdgeInsets.only(left: 8, right: 8,bottom: 10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 4,
        child: Padding(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 15.0, bottom: 25.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    title: 'For Owner',
                    color: Colors.blue,
                  ),
                  SizedBox(height: 13.0),
                  TextFieldWidget(
                      hintText: "Owner name",
                      controller: _editOwnerName,
                      letterSpacing: 1.0,
                      minLine: 1),
                  SizedBox(height: 13.0),
                  TextFieldWidget(
                      hintText: "Owner Contact",
                      controller: _editOwnerMobile,
                      maxLength: 10,
                      letterSpacing: 2.0,
                      color: Colors.white,
                      keyboardType: TextInputType.number),
                  SizedBox(height: 13.0),
                  TextFieldWidget(
                      hintText: "Owner email id",
                      controller: _editOwnerEmail,
                      letterSpacing: 1.0,
                      minLine: 1,),
                ])));
  }

  _addLocation() async {
    LocationResult result = await showLocationPicker(
      context, Config.api_key,
//    initialCenter: LatLng(31.1975844, 29.9598339),
      automaticallyAnimateToCurrentLocation: true,
//    mapStylePath: 'assets/mapStyle.json',
      myLocationButtonEnabled: true,
      layersButtonEnabled: true,
      resultCardAlignment: Alignment.bottomCenter,
    );
    print("result = $result");
    setState(() {
      _pickedLocation = result;
      _editStoreAddress.text = _pickedLocation.address.toString();
    });
  }


}

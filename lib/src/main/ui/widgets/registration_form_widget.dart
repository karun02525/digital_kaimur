import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/textfield_widget.dart';
import 'package:digitalkaimur/src/res/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';


import 'button_widget.dart';

class RegistrationFormWidget extends StatefulWidget {
  @override
  _RegistrationFormWidgetState createState() => _RegistrationFormWidgetState();
}

class _RegistrationFormWidgetState extends State<RegistrationFormWidget> {
  LocationResult _pickedLocation;

  var _editName = TextEditingController();
  var _editMobile = TextEditingController();
  var _editEmail = TextEditingController();
  var _editAdress = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          title: 'Register',
        ),
      ),
      body: inputWidget(),
    );
  }

  Widget inputWidget() {
    return SingleChildScrollView(
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 10.0,
        runSpacing: 10.0,
        children: [
          _setContent(),
          _tile1(),
          _tile2(),
          _tile3(),
          ButtonWidget(
            title: 'Sumbit',
            onPressed: () {},
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _tile3() {
    return Card(
        margin: EdgeInsets.only(left: 5.0, right: 5.0),
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
                      controller: _editName,
                      letterSpacing: 1.0,
                      keyboardType: TextInputType.text,
                      minLine: 1),
                  SizedBox(height: 13.0),
                  TextFieldWidget(
                      hintText: "Owner Contact",
                      controller: _editMobile,
                      maxLength: 10,
                      letterSpacing: 2.0,
                      color: Colors.white,
                      keyboardType: TextInputType.number),
                  SizedBox(height: 13.0),
                  TextFieldWidget(
                      hintText: "Owner email id",
                      controller: _editEmail,
                      letterSpacing: 1.0,
                      minLine: 1,
                      keyboardType: TextInputType.emailAddress),
                ])));
  }

  Widget _tile1() {
    return Card(
      margin: EdgeInsets.only(left: 5.0, right: 5.0),
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
                  controller: _editName,
                  letterSpacing: 1.0,
                  keyboardType: TextInputType.text,
                  minLine: 1),
              SizedBox(height: 15.0),
              TextFieldWidget(
                  hintText: "Enter store email id",
                  controller: _editName,
                  letterSpacing: 1.0,
                  keyboardType: TextInputType.emailAddress,
                  minLine: 1),
              SizedBox(height: 15.0),
              TextFieldWidget(
                  hintText: "Enter store mobile number",
                  controller: _editMobile,
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
        margin: EdgeInsets.only(left: 5.0, right: 5.0),
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
                    onPressed:_addLocation,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 13.0),
                  TextFieldWidget(
                      hintText: "Enter store address",
                      controller: _editAdress,
                      letterSpacing: 1.0,
                      maxLength: 3,
                      keyboardType: TextInputType.text,
                      minLine: 3),
                  SizedBox(height: 13.0),
                  TextFieldWidget(
                      hintText: "Enter store near by",
                      controller: _editName,
                      letterSpacing: 1.0,
                      keyboardType: TextInputType.text,
                      minLine: 1),
                  SizedBox(height: 13.0),
                  TextFieldWidget(
                      hintText: "Enter pin code",
                      controller: _editMobile,
                      maxLength: 6,
                      letterSpacing: 2.0,
                      color: Colors.white,
                      keyboardType: TextInputType.number),
                ])));
  }

  Widget _setContent() {
    return Card(
        margin: EdgeInsets.only(left: 5.0, right: 5.0),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 4,
        child: Padding(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 15.0, bottom: 25.0),
            child: Container(
              width: double.infinity,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(title: 'Store Registration No'),
                  TextWidget(
                    title: '#7678688799898',
                    color: Colors.blueAccent,
                    fontSize: 14.0,
                    ls: 1.6,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RichText(
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          spanDecoration('Store Category: ', Colors.grey),
                          spanDecoration('Hospital', Colors.blueAccent)
                        ]),
                  ),
                ],
              ),
            )));
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
    setState((){
      _pickedLocation = result;
      _editAdress.text=_pickedLocation.address.toString();
    });

  }
}

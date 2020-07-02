import 'dart:ui';

import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorVerifyDialog extends StatefulWidget {
  @override
  _VendorVerifyDialogState createState() => _VendorVerifyDialogState();
}

class _VendorVerifyDialogState extends State<VendorVerifyDialog> {
  int status = 0;
  bool isVerify=false;

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        get(context),
        im(),
      ],
    );
  }

  Widget im() {
    return Positioned(
      left: Consts.padding,
      right: Consts.padding,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.asset('assets/images/vegetable.png'),
        ),
        radius: Consts.avatarRadius,
      ),
    );
  }

  Widget get(context) {
    return Container(
      padding: EdgeInsets.only(
        top: Consts.avatarRadius,
        bottom: Consts.padding,
        left: Consts.padding,
        right: Consts.padding,
      ),
      margin: EdgeInsets.only(top: Consts.avatarRadius),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          status == 0 ? TextWidget(title: "Pending", color: Colors.orange, isBold: true, fontSize: 20.0) :
          status == 1 ? TextWidget(title: "Payment Successfully", color: Colors.green, isBold: true, fontSize: 20.0):
          status == 2 ? TextWidget(title: "Payment Failed try again", color: Colors.red, isBold: true, fontSize: 20.0):
          status == 3 ? TextWidget(title: "Rejected", color: Colors.red, isBold: true, fontSize: 20.0):
          SizedBox(height: 10.0),
          TextWidget(
              title: "Please Pay ₹100 rupees for your shop registered",
              isBold: true),
          SizedBox(height: 10.0),
          Visibility(
            visible: isVerify,
         child:RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/register-store');// To close the dialog
              },
              child: TextWidget(
                title: "Add Your Shop",
                isBold: true,
              ))),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(); // To close the dialog
                },
                child: TextWidget(title: "Close")),
          ),
        ],
      ),
    );
  }
}

class Consts {
  Consts._();
  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}
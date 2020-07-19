import 'dart:ui';

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/verify_model.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorVerifyDialog extends StatelessWidget {
  DataModel data;
  bool status = true;
  VendorVerifyDialog({this.data});
  String message = '';

  @override
  Widget build(BuildContext context) {
    if (data.isVerify == 1) {
      status = true;
      message = 'Your Verification Pending';
    } else if (data.isVerify == 3) {
      status = false;
      message = 'Your Shop has been rejected';
    }

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
        topIcon(),
      ],
    );
  }

  Widget topIcon() {
    return Positioned(
      left: Consts.padding,
      right: Consts.padding,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.network(Config.baseCategoryImageUrl+data.cavatar??''),
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
            offset: const Offset(0.0, 20.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          showStatus(),
          Divider(),
          SizedBox(
            height: 10.0,
            width: MediaQuery.of(context).size.width,
          ),
          TextWidget(title: 'Your Register Id:', isBold: true, fontSize: 14.0,ls:0.5,color: Colors.black87),
          TextWidget(title: '#${data.vid}', isBold: true, fontSize: 12.0,ls:1.0,color: Colors.black38,),
          TextWidget(title: 'Category: ${data.cname??''}', isBold: true, fontSize: 12.0,ls:1.0,color: Colors.blueAccent,),
          SizedBox(height: 30.0),
          RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: TextWidget(
                title: "Done",
                isBold: true,
              ))
        ],
      ),
    );
  }

  Widget showStatus() {
    return status
        ? TextWidget(
            title: message, color: Colors.green, isBold: true, fontSize: 15.0,ls:1.0)
        : TextWidget(
            title: message, color: Colors.red, isBold: true, fontSize: 15.0,ls:1.0);
  }
}

class Consts {
  Consts._();
  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

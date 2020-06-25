import 'dart:ui';

import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upi_india/upi_india.dart';

class CustomDialog extends StatefulWidget {
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  Future<UpiResponse> _transaction;
  int status = 0;
  bool isPaymentSuccess=false;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp> apps;

  @override
  void initState() {
    _upiIndia.getAllUpiApps().then((value) {
      setState(() {
        apps = value;
      });
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(String app) async {
    return _upiIndia
        .startTransaction(
      app: app,
      receiverUpiId: 'karun25@ybl',
      receiverName: 'Karun Kumar',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'This is required for your shop',
      amount: 1.00,
    )
        .then((response) {
      print("UPI_INDIA_FINAL_RESPONSE: $response");

      if(response.status=="success"){
        setState(() {
          isPaymentSuccess=true;
          status = 1;
        });
      }else{
        setState(() {
          isPaymentSuccess=false;
          status = 2;
        });
      }

    }).catchError((e) {
      setState(() {
        isPaymentSuccess=false;
        status = 2;
      });
      print("UPI_INDIA_FINAL_RESPONSE: invalid_parameters");
      return UpiResponse('invalid_parameters');
    });
  }

  Widget displayUpiApps() {
    return Wrap(
      children: apps.map<Widget>((UpiApp app) {
        return GestureDetector(
          onTap: () {
            _transaction = initiateTransaction(app.app);
            setState(() {});
          },
          child: Container(
            height: 60.0,
            width: 50.0,
            child: Column(
              children: <Widget>[
                Image.memory(
                  app.icon,
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  height: 3.0,
                ),
                TextWidget(
                  title: app.name,
                  fontSize: 7.0,
                  isBold: true,
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
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
          displayUpiApps(),
          Visibility(
            visible: isPaymentSuccess,
         child:RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop(); // To close the dialog
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

  Widget successPay() {
    return Expanded(
      flex: 2,
      child: FutureBuilder(
        future: _transaction,
        builder: (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('An Unknown error has occured'));
            }
            UpiResponse _upiResponse;
            _upiResponse = snapshot.data;
            if (_upiResponse.error != null) {
              String text = '';
              switch (snapshot.data.error) {
                case UpiError.APP_NOT_INSTALLED:
                  text = "Requested app not installed on device";
                  break;
                case UpiError.INVALID_PARAMETERS:
                  text = "Requested app cannot handle the transaction";
                  break;
                case UpiError.NULL_RESPONSE:
                  text = "requested app didn't returned any response";
                  break;
                case UpiError.USER_CANCELLED:
                  text = "You cancelled the transaction";
                  break;
              }
              return Center(
                child: Text(text),
              );
            }
            String txnId = _upiResponse.transactionId;
            String resCode = _upiResponse.responseCode;
            String txnRef = _upiResponse.transactionRefId;
            String status = _upiResponse.status;
            String approvalRef = _upiResponse.approvalRefNo;
            switch (status) {
              case UpiPaymentStatus.SUCCESS:
                print('Transaction Successful');
                break;
              case UpiPaymentStatus.SUBMITTED:
                print('Transaction Submitted');
                break;
              case UpiPaymentStatus.FAILURE:
                print('Transaction Failed');
                break;
              default:
                print('Received an Unknown transaction status');
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Transaction Id: $txnId\n'),
                Text('Response Code: $resCode\n'),
                Text('Reference Id: $txnRef\n'),
                Text('Status: $status\n'),
                Text('Approval No: $approvalRef'),
              ],
            );
          } else
            return Text(' ');
        },
      ),
    );
  }
}

class Consts {
  Consts._();
  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

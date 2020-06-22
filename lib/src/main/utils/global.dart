
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Global {


  static void toast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  static void snackBar(BuildContext context,String message){
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(message==null ? '---':message)));
  }

  static void showSnackBar(BuildContext context,String message){
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Show Snackbar'),
      duration: Duration(seconds: 3),
    ));
  }


  static List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://lh3.googleusercontent.com/qIaAjodlsDEjewTG9mKYJz17su5I28f6AzL76tJ6ERexiq6VrqlE-dcLJTYWAPRHq1hzbKCwa2RuetEO4g=w1080-h608-p-no-v0',
    'https://www.yayskool.com/images/school/4192708paradise-children-academy-lalapur-kaimur.jpg',
    'https://images.ixigo.com/image/upload/hotel/c_fill,w_220,h_220/mohania-vihar-hotel-mohani-image-559e952be4b0ffb8fe44139f',
    'https://i.ytimg.com/vi/KcIMRQILEm8/maxresdefault.jpg',
    'https://cdn.s3waas.gov.in/s3daca41214b39c5dc66674d09081940f0/uploads/2018/03/2018032957.jpg',
    'data:image/jpeg;base64,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',
    'https://media-cdn.tripadvisor.com/media/photo-s/09/d9/4b/0f/getlstd-property-photo.jpg',
    ];


}
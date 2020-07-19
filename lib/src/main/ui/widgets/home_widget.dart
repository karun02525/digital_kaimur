import 'package:digitalkaimur/src/main/model/home_store_model.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'header_home_widget.dart';
import 'image_slider_widget.dart';
import 'rating_widget.dart';



class HomeWidget extends StatelessWidget {
  final StoreModel item;
  BuildContext context;
  HomeWidget({this.item});

  @override
  Widget build(BuildContext context) {
    this.context=context;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderHomeWidget(item:item),
          ImageSliderWidget(imgList:item?.imgarray??[]),
          paddingView(),
          Container(height: 10, color: Colors.grey[200]),
        ],
      ),
    );
  }

  Widget paddingView(){
    return Container(
      margin: EdgeInsets.only(left:7.0,top: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         RatingWidget(rating:3.5),
         TextWidget(title: item.mobile??'--',fontSize: 12.0,left: 5),
         TextWidget(title: item.email??'--',fontSize: 12.0,left: 5),
         TextWidget(title: item.address??'--' + item.pinCode??'--', fontSize: 12.0,left: 5),
         TextWidget(title: item.nearby??'--', fontSize: 12.0,left: 5,bottom: 10,),

         // Divider(),
         // HomeLikeCmt(item: item),
        ],
      ),
    );
  }

}

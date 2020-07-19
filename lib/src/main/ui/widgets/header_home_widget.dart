
import 'package:digitalkaimur/src/main/model/home_store_model.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_load_widget.dart';

class HeaderHomeWidget extends StatelessWidget {
  StoreModel item;
  BuildContext context;
  HeaderHomeWidget({this.item});

  @override
  Widget build(BuildContext context) {
    this.context=context;
    return getHeadTitle();
  }

  Widget getHeadTitle() {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
         ImageLoadWidget(imageUrl:item.userAvatar,name:item.name??'K'),
          setContent()
        ],
      ),
    );
  }

  Widget setContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextWidget(
                title:item.name??'',
                fontSize: 13.0,
              ),
              TextWidget(
                left: 10,
                title:item.cname??'',
                fontSize: 13.0,
                isBold: true,
                color: Colors.blueAccent,
              )
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextWidget(
                title:item.sname??'',
                fontSize: 13.0,
                isBold: true,
                color: Colors.black,
              ),
            ],
          ),


         /* InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ReviewDetails(pid:item.pid,pname:item.pname)));
              },
              child: TextWidget(
                title: item.pname??'N.A',
                isBold: true,
              ))*/
        ],
      ),
    );
  }
}

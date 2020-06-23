import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/res/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/text_widget.dart';
import '../../../utils/global.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Theme.of(context).primaryColor));
    final double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Column(
          children: [
            Container(
                height: height / 3,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                    children: [getProfileImage(Config.avatar1), setName()])),
            SizedBox(height: 30.0),
            setMenu(context)
          ],
        ),
      ),
    );
  }

  Widget setName() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          TextWidget(
            title: 'Karun Kumar',
            isBold: true,
            color: Colors.white,
            fontSize: 18.0,
          ),
          TextWidget(
            title: 'karunkumar2525@gmail.com',
            isBold: true,
            color: Colors.white,
            fontSize: 12.0,
          ),
        ],
      ),
    );
  }

  Widget getProfileImage(String url) {
    return Container(
      width: 140,
      height: 140,
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      child: url == null
          ? placeHolder()
          : CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => placeHolder(),
              imageUrl: url,
            ),
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: new Border.all(
          color: Colors.blue,
          width: 3.0,
        ),
      ),
    );
  }

  Widget placeHolder() {
    return ClipOval(
        child: Image(image: AssetImage('assets/images/user_icon.png')));
  }

  Widget setMenu(cnt) {
    return Expanded(
        child:
            GridView.count(crossAxisCount: 2, childAspectRatio: 2.2, children: [
      ItemWidget(
        name: 'Change Language',
        icon: Icons.language,
        onClick: () {
          Global.toast('Change Langure');
        },
      ),
      ItemWidget(
        name: 'For Vender',
        icon: Icons.shopping_basket,
        onClick: () {
          _modalBottomSheetMenu(cnt);
        },
      ),
      ItemWidget(
        name: 'Settings',
        icon: Icons.settings,
        onClick: () {
          Global.toast('Setting');
        },
      ),
      ItemWidget(
        name: 'About',
        icon: Icons.domain,
        onClick: () {
          Global.toast('Setting');
        },
      ),
      ItemWidget(
        name: 'Help',
        icon: Icons.help,
        onClick: () {
          Global.toast('Setting');
        },
      ), ItemWidget(
        name: 'Log Out',
        icon: AppIcons.ic_logout,
        onClick: () {
          Global.toast('Setting');
        },
      ),
    ]));
  }


  void _modalBottomSheetMenu(context){
    final double height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext context) {
          return Container(
            height: height,
          );
        });
  }


}

class ItemWidget extends StatelessWidget {
  IconData icon;
  String name;
  Function onClick;

  ItemWidget({
    this.icon,
    this.name,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12.0),
      elevation: 5.0,
      color: Colors.grey,
      child: InkWell(
        onTap: onClick,
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 8.0,
          children: [
            Icon(
              icon,
              color: Colors.white70,
              size: 25.0,
            ),
            TextWidget(
              title: name,
              isBold: true,
              color: Colors.white70,
            )
          ],
        ),
      ),
    );
  }
}

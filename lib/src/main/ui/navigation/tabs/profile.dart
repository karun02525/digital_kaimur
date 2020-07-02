import 'package:digitalkaimur/src/main/ui/profile/for_vender/create_vendor_bottomsheet.dart';
import 'package:digitalkaimur/src/main/ui/profile/info_profile.dart';
import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';
import 'package:digitalkaimur/src/res/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/global.dart';
import '../../widgets/text_widget.dart';

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
                child: InfoProfile(context: context)),
            SizedBox(height: 30.0),
            setMenu(context)
          ],
        ),
      ),
    );
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
          UserPreference().clearSharedPreferences().then((value){
            if(value){
              Global.navigateToLogin(cnt);
            }
          });
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
            height: height/2,
            child: CreateVendor(),
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

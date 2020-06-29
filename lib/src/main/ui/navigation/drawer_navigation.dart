import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String name,email,avatar;

  @override
  void initState() {
    var pref=UserPreference();
    name=pref.name;
    email=pref.email;
    avatar=pref.avatar;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  color: Theme.of(context).primaryColor,
                  child: Center(
                      child: Column(
                        children: <Widget>[getProfileImage(), getInfo()],
                      ))),
              CustomListTile(Icons.home, "Home",
                      () => {Navigator.pushNamed(context, '/home')}),
              Divider(color: Colors.grey),
              CustomListTile(Icons.add_circle_outline, "Add Category",
                      () => {Navigator.pushNamed(context, '/add_category')}),
              Divider(color: Colors.grey),
              CustomListTile(Icons.playlist_add, "Add Product ",
                      () => {Navigator.pushNamed(context, '/add_product')}),
              Divider(color: Colors.grey),
              CustomListTile(Icons.verified_user, "Security", () => {}),
              Divider(color: Colors.grey),
              CustomListTile(Icons.star, "Ratings", () => {}),
              Divider(color: Colors.grey),
              CustomListTile(Icons.wb_sunny, "Version", () => {}),
              Divider(color: Colors.grey),
            ],
          ),
        ));
  }

  Widget getProfileImage() {
    return Container(
      width: 140,
      height: 140,
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      child: avatar == null
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
        imageUrl: avatar,
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

  Widget getInfo() {
    return Column(
      children: <Widget>[
        Text(
          name??'N.A',
          style: TextStyle(color: Colors.white, fontSize: 22.0),
        ),
        Text(
          email??'N.A',
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 10, 8.0, 10),
      child: InkWell(
        splashColor: Colors.cyanAccent,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(icon),
            SizedBox(width: 10.0),
            Text(
              text,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}

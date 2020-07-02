import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/repositories/login_repository.dart';
import 'package:digitalkaimur/src/main/ui/profile/camera_picker.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';
import 'package:flutter/material.dart';

class InfoProfile extends StatefulWidget {
  final BuildContext context;
  InfoProfile({Key key, this.context}) : super(key: key);

  @override
  _InfoProfileState createState() => _InfoProfileState(context);
}

class _InfoProfileState extends State<InfoProfile> {
  BuildContext context;
  String name, email, avatar;
  File imageFile;
  LoginRespository _respository;

  _InfoProfileState(BuildContext context) {
    this.context = context;
    _respository = LoginRespository(context);
  }

  @override
  Widget build(BuildContext context) {
    var pref = UserPreference();
    name = pref.name;
    email = pref.email;
    avatar = pref.avatar;
    return Column(children: [getProfileImage(), setName()]);
  }

  getImageFile(File file) {
    _respository.profilePictureUpdate(file).then((value) {
      if (value) {
        setState(() {
          avatar = UserPreference().avatar;
        });
      }
    });
  }

  Widget setName() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          TextWidget(
            title: name ?? 'N.A',
            isBold: true,
            color: Colors.white,
            fontSize: 18.0,
          ),
          TextWidget(
            title: email ?? 'N.A',
            isBold: true,
            color: Colors.white,
            fontSize: 12.0,
          ),
        ],
      ),
    );
  }

  Widget getProfileImage() {
    return GestureDetector(
        onTap: () {
          CameraPickerWidget(context: context, getImageFile: getImageFile);
        },
        child: Container(
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
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => placeHolder(),
                  imageUrl: Config.baseProfileImageUrl+avatar,
                ),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: new Border.all(
              color: Colors.blue,
              width: 3.0,
            ),
          ),
        ));
  }

  Widget placeHolder() {
    return ClipOval(
        child: Image(image: AssetImage('assets/images/user_icon.png')));
  }

  Widget placeFileImage() {
    return CircleAvatar(
        backgroundImage: new FileImage(imageFile), radius: 200.0);
    /* ClipOval(
        child: Image.file(imageFile));*/
  }
}

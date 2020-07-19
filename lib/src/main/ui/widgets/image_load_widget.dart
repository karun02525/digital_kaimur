import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageLoadWidget extends StatelessWidget {
  final String imageUrl, name;
  ImageLoadWidget({this.imageUrl, this.name = "Popwoot"});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 40.0,
        height: 40.0,
        margin: EdgeInsets.only(right: 5.0),
        child: imageUrl == null
            ? CircleAvatar(child: Text(name.toString().toUpperCase()[0]))
            : CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                //  placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: Config.baseProfileImageUrl + imageUrl,
                fit: BoxFit.fill,
              ));
  }
}

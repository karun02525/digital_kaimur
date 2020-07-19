import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageLoadBigWidget extends StatelessWidget {
  final String imageUrl;
  ImageLoadBigWidget({this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return imageUrl == null
            ? Container(
                height: 230.0,
                width: double.infinity,
                child: Image(image: AssetImage('assets/images/no_image.jpg')))
            : Container(
                height: 230.0,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) =>
                      Image(image: AssetImage('assets/images/no_image.jpg')),
                ));
  }
}

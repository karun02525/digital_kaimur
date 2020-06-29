import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'image_load_widget.dart';

class GridDashboard extends StatelessWidget {
  final DataList item;
  GridDashboard(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    height: 60.0,
                    width: 60.0,
                    child: ImageLoadWidget(
                        imageUrl: Config.baseImageUrl + item.categoryAvatar)),
                SizedBox(height: 5.0),
                Padding(
                  padding: EdgeInsets.only(left: 2.0, right: 2.0),
                  child: TextWidget(
                    title: item.categoryName,
                    isBold: true,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

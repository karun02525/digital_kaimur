import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:digitalkaimur/src/main/ui/widgets/carousel_slider.dart';
import 'package:digitalkaimur/src/main/ui/widgets/grid_dashboard_widget.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  final List<DataList> categoryList;
  CategoryWidget(this.categoryList);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      FullscreenSlider(),
                      SizedBox(height: 5.0),
                    ],
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  delegate: SliverChildBuilderDelegate((
                      BuildContext context, int index) {
                      return GridDashboard(widget.categoryList[index]);
                    },
                    childCount: widget.categoryList.length,
                  ),
                )

              ],
            )));
  }
}

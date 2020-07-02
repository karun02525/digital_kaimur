import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:digitalkaimur/src/main/repositories/category_repository.dart';
import 'package:digitalkaimur/src/main/ui/dashboard/category_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/dialog_widgets.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../drawer_navigation.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SelectCityModel> cityList;

  int cityId = -1;
  String selectName = "Select City";
  String _valProvince;
  bool isSelect = false;

  List<DataList> categoryList;
  CategoryRepository _repository;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _repository = CategoryRepository(context);
    fetchCategory();
    cityList = SelectCityModel.getCityList();
    // Timer(Duration(seconds: 1), () =>openDialog() );
  }

  void fetchCategory(){
    _repository.findAllCategory().then((value){
      setState(() {
        _isLoading = false;
        categoryList=value;
      });
    });
  }


  selectCity(int selectValue) {
    setState(() {
      cityId = selectValue;
      selectName = "${cityList[selectValue].eng} (${cityList[selectValue].hi})";
    });
  }

  void openDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return DialogWidget(cityList, cityId);
        }).then((value) => {selectCity(value)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 2.0,
          title: Column(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    openDialog();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextWidget(title: selectName, isBold: true),
                      Icon(Icons.arrow_drop_down)
                    ],
                  )),
            ],
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              icon: Icon(Icons.search),
            )
          ],
        ),
        drawer: NavigationDrawer(),
        body: _isLoading
            ? Container(child: Center(child: CupertinoActivityIndicator()))
            : categoryList == null ? Container(
            child: Center(child: TextWidget(title: "No Data Available")))
                : CategoryWidget(categoryList));

    //  FullscreenSlider(),
  }
}

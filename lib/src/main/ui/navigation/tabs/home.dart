import 'dart:convert';

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/ui/widgets/carousel_slider.dart';
import 'package:digitalkaimur/src/main/ui/widgets/dialog_widgets.dart';
import 'package:digitalkaimur/src/main/ui/widgets/grid_dashboard_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:dio/dio.dart';
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

  List categoryList = [];
  Dio dio;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    cityList = SelectCityModel.getCityList();
    dio = Dio();
    getCategoryAllAsync();
    // Timer(Duration(seconds: 1), () =>openDialog() );
  }

  void getCategoryAllAsync() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': 'Bearer ${Config.token}'
      };

      final response = await dio.get(Config.getCategoryUrl,
          options: Options(headers: requestHeaders));
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(jsonEncode(response.data));
        if (responseBody['status']) {
          hideLoader();
          setState(() {
            debugPrint("Follow Category: data  " + responseBody.toString());
            categoryList = responseBody['data'];
          });
        }
      }
    } on DioError catch (e) {
      var errorMessage = jsonDecode(jsonEncode(e.response.data));
      var statusCode = e.response.statusCode;
      if (statusCode == 400) {
        hideLoader();
        Global.toast(errorMessage['message']);
      } else if (statusCode == 401) {
        hideLoader();
        Global.toast(errorMessage['message']);
      } else {
        hideLoader();
        Global.toast('Something went wrong');
      }
    }
  }

  void hideLoader() {
    setState(() {
      _isLoading = false;
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
            : categoryList.length == 0
                ? Container(
                    child:
                        Center(child: TextWidget(title: "No Data Available")))
                : Container(
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
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return GridDashboard(categoryList[index]);
                            },
                            childCount: categoryList.length,
                          ),
                        )



                      ],
                    ))));

    //  FullscreenSlider(),
  }
}

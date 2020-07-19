import 'package:digitalkaimur/src/main/model/home_store_model.dart';
import 'package:digitalkaimur/src/main/repositories/home_store_repository.dart';
import 'package:digitalkaimur/src/main/ui/widgets/home_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/search_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeDetails extends StatefulWidget {
  @override
  _HomeDetailsState createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  List<StoreModel> storeList = [];
  HomeStoreRepository _repository;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _repository = HomeStoreRepository(context);
    getReviewList();
  }

  void getReviewList() {
    _repository.findAllStore().then((value) {
      setState(() {
        _isLoading = false;
        storeList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light));

    return Scaffold(
        appBar: AppBar(titleSpacing: 2.0, title: TextSearchWidget()),
        body: _isLoading
            ? Container(
                child: Center(
                    child: CupertinoActivityIndicator(
                radius: 20,
              )))
            : storeList == null
                ? Container(
                    child:
                        Center(child: TextWidget(title: 'No items available')))
                : storeList.length == 0
                    ? Container(
                        child: Center(
                            child: TextWidget(
                        title: 'No items available',
                      )))
                    : ListView.builder(
                        itemCount: null == storeList ? 0 : storeList.length,
                        itemBuilder: (context, index) =>
                            HomeWidget(item: storeList[index])));
  }
}

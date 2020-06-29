import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:digitalkaimur/src/main/repositories/category_repository.dart';
import 'package:flutter/material.dart';

class ListRegisterPage extends StatefulWidget {
  @override
  _ListRegisterPageState createState() => _ListRegisterPageState();
}

class _ListRegisterPageState extends State<ListRegisterPage> {
  Future<List<DataList>> listFuture;
  CategoryRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = CategoryRepository();
    listFuture = _repository.findAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.listFuture,
        builder: (context, AsyncSnapshot<List<DataList>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Column(
              children: [
                Icon(Icons.error_outline, color: Colors.red, size: 60.0),
                Text('Error: ${snapshot.error}')
              ],
            ));
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  var item = snapshot.data[index];
                  return ListTile(
                    title: Text(item.categoryPostion.toString()),
                    subtitle: Text(item.categoryName),
                  );
                });
          }
        },
      ),
    );
  }
}

/*Service.getCategory().then((value){
setState(() {
list=value;
_loading=false;
});*/

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: _loading ? Container(child: Center(child: CircularProgressIndicator())):
          Container(
            child: ListView.builder(
                itemCount:null==list? 0:list.length,
                itemBuilder: (context,index){
                  DataList item= list[index];
                 return ListTile(
                    title: Text(item.categoryPostion.toString()),
                    subtitle: Text(item.categoryName),
                 );
            }),
          )

    );
  }
*/

import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:digitalkaimur/src/main/service/repositories/category_repository.dart';
import 'package:digitalkaimur/src/main/service/repositories/login_repository.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future<List<Datum>> listFuture;
  CategoryRepository _repository;

  @override
  void initState() {
    super.initState();
    LoginRespository().loginUser('8920828585', '11111111');
    _repository = CategoryRepository();
    listFuture = _repository.findAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.listFuture,
        builder: (context, AsyncSnapshot<List<Datum>> snapshot) {
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
                  Datum item= list[index];
                 return ListTile(
                    title: Text(item.categoryPostion.toString()),
                    subtitle: Text(item.categoryName),
                 );
            }),
          )

    );
  }
*/

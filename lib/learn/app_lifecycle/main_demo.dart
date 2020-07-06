import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body:AppLifeCycle()
      ),
    );
  }
}

class AppLifeCycle extends StatefulWidget {
  @override
  _AppLifeCycleState createState() => _AppLifeCycleState();
}

class _AppLifeCycleState extends State<AppLifeCycle> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if(state==AppLifecycleState.resumed){
      print('_____________________________________________________________');
      print('resumed ');
      print('_____________________________________________________________');
    }else if(state==AppLifecycleState.paused){
      print('_____________________________________________________________');
      print('paused ');
      print('_____________________________________________________________');
    }
  }


  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context,orientation){
          return Center(
            child: Container(
                child: RaisedButton(
                  child: Text('Second page',
                   style: TextStyle(color: orientation==Orientation.portrait?Colors.blue:Colors.green),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>SecondPage()
                    ));
                  },
                )
            ),
          );
        },
    );
  }
}

//_______________________________________________


class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state== AppLifecycleState.resumed){
      Navigator.popUntil(context, (route) => route.settings.name=='/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



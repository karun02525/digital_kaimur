import 'package:digitalkaimur/src/main/ui/widgets/registration_form_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/res/fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterStore extends StatefulWidget {
  final String vid,cid,cname;
  RegisterStore({Key key,this.vid,this.cid,this.cname}):super(key:key);

  @override
  _RegisterStoreState createState() => _RegisterStoreState();
}

class _RegisterStoreState extends State<RegisterStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 2.0,
        elevation: 0.0,
        title: TextWidget(title: "Add Store", fontSize: AppFonts.toolbarSize,isBold: true),
      ),
      body: RegistrationFormWidget(vid: widget.vid,cid: widget.cid,cname: widget.cname,),
    );
  }
}

import 'package:digitalkaimur/src/main/config/constraints.dart';
import 'package:digitalkaimur/src/main/model/category_model.dart';
import 'package:digitalkaimur/src/main/model/verify_model.dart';
import 'package:digitalkaimur/src/main/repositories/category_repository.dart';
import 'package:digitalkaimur/src/main/ui/profile/for_vender/vendor_verify_dialog.dart';
import 'package:digitalkaimur/src/main/ui/widgets/button_widget.dart';
import 'file:///D:/project/app/digital_kaimur/lib/src/main/ui/profile/for_vender/payment_dialog.dart';
import 'package:digitalkaimur/src/main/ui/widgets/dropdown_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/image_load_widget.dart';
import 'package:digitalkaimur/src/main/ui/widgets/text_widget.dart';
import 'package:digitalkaimur/src/main/utils/global.dart';
import 'package:digitalkaimur/src/main/utils/shared_preferences.dart';
import 'package:digitalkaimur/src/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateVendor extends StatefulWidget {
  @override
  _CreateVendorState createState() => _CreateVendorState();
}

class _CreateVendorState extends State<CreateVendor> {
  String catId;
  List<DataList> categoryList;

  CategoryRepository _repository;
  bool isLoading = true;
  String name, email, mobile;


  @override
  void initState() {
    var pref = UserPreference();
    name = pref.name;
    email = pref.email;
    mobile = pref.mobile;
    super.initState();
    _repository = CategoryRepository(context);
    fetchCategory();
  }

  void fetchCategory() {
    _repository.findAllCategory().then((value) {
      setState(() {
        isLoading = false;
        categoryList = value;
      });
    });
  }

  void submit() {
    isLoading = true;
    _repository.vendorRegister(catId).then((value) {
      setState(() {
        isLoading = false;
      });
      if (value) {
        Navigator.pop(context);
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => VendorVerifyDialog());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 10.0, bottom: 5.0),
            child: TextWidget(
              title: AppString.createVendor,
              color: Colors.green,
              fontSize: 18.0,
              isBold: true,
            ),
          ),
          Divider(),
          Visibility(
              visible: isLoading,
              child: CupertinoActivityIndicator(radius: 15.0)),
          Container(
            margin: EdgeInsets.only(left: 30.0, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                setContent(),
                getCategoryDropDown(),
                SizedBox(height: 10.0),
                ButtonWidget(
                  title: AppString.submit,
                  color: Colors.blue,
                  onPressed: submit,
                  isBold: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget setContent() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 10.0,
      ),
      TextWidget(
        title: 'Name:   ${name ?? 'N.A'}',
        isBold: true,
      ),
      SizedBox(
        height: 10.0,
      ),
      TextWidget(
        title: 'Mobile:  +91 ${mobile ?? 'N.A'}',
        isBold: true,
      ),
      SizedBox(
        height: 10.0,
      ),
      TextWidget(
        title: 'Email Id:  ${email ?? 'N.A'}',
        fontSize: 13.0,
        isBold: true,
      ),
      SizedBox(
        height: 20.0,
      )
    ]);
  }

  Widget getCategoryDropDown() {
    return DropdownWidget(
      hint: AppString.select_category,
      value: catId,
      items: categoryList?.map((item) {
        return DropdownMenuItem(
            value: item.categoryId,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 35.0,
                    height: 35.0,
                    margin: EdgeInsets.only(right: 15.0, left: 10.0),
                    child: ImageLoadWidget(
                      imageUrl: Config.baseImageUrl + item.categoryAvatar,
                      isProfile: false,
                    )),
                TextWidget(
                  title: item.categoryName,
                  isBold: true,
                ),
              ],
            ));
      })?.toList(),
      onChanged: (newValue) {
        setState(() {
          catId = newValue;
        });
      },
    );
  }
}

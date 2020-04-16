import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopNavigation extends StatelessWidget {
  final List navigationList;

  TopNavigation({Key key, this.navigationList}) : super(key: key) {
    if (navigationList.length > 10) {
      navigationList.removeRange(10, navigationList.length);
    }
  }

  Widget _getItemUI(BuildContext context, var item) {
    return
      Container(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            print("点击了导航${item['mallCategoryName']}");
          },
          child: Column(
            children: <Widget>[
              Image.network(
                item['image'],
                width: ScreenUtil().setWidth(95),
              ),
              Text(
                item['mallCategoryName'],
              ),
            ],
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(Platform.isIOS ? 270 : 320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigationList.map((value) {
          return _getItemUI(context, value);
        }).toList(),
      ),
    );
  }
}

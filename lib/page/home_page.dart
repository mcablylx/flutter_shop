import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop/page/widget/swiper_banner.dart';
import 'package:shop/services/service_method.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: FutureBuilder(
          future: getHomeContent(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              List<Map> swiperDataList = (data['data']['slides'] as List).cast();
              return Column(
                children: <Widget>[SwiperDiy(swiperDataList: swiperDataList)],
              );
            } else {
              return Text('加载中....');
            }
          },
        ),
      ),
    );
  }
}

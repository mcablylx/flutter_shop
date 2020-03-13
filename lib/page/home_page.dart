import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop/page/widget/adv_banner.dart';
import 'package:shop/page/widget/leader_phone.dart';
import 'package:shop/page/widget/swiper_banner.dart';
import 'package:shop/page/widget/top_navigation.dart';
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
          //snapshot 服务器返回来的数据
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //将json数据转换成了map
              var data = json.decode(snapshot.data.toString());
              var root = data['data'];
              //取数据
              List<Map> swiperDataList =
                  (root['slides'] as List).cast();

              List<Map> topNavigation =
                  (root['category'] as List).cast();
              String adv_url = root['advertesPicture']['PICTURE_ADDRESS'].toString();
              String leaderPhone = root['shopInfo']['leaderPhone'].toString();
              String leaderImage = root['shopInfo']['leaderImage'].toString();
              return Column(
                children: <Widget>[
                  SwiperDiy(swiperDataList: swiperDataList),
                  TopNavigation(navigationList: topNavigation),
                  AdvBanner(adv_url: adv_url,),
                  LeaderPhone(leaderPhone: leaderPhone, leaderImage: leaderImage,)
                ],
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

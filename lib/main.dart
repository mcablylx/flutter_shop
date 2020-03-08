import 'package:flutter/material.dart';
import 'package:shop/page/index_page.dart';

/// 拉大锯 扯大锯 亲爱的 别生气 我锯你的胳膊 我锯你的腿 我捧起你的脑袋 亲你的嘴
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "百姓生活+",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor:Colors.pink,
        ),
        home: IndexPage(),
      ),
    );
  }
}

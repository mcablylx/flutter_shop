import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendProduct extends StatelessWidget {
  final List recommendList;

  RecommendProduct({Key key, this.recommendList}) : super(key: key);

  Widget _topWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 5.0),

      child: Text(
        '商品推荐',
        style: TextStyle(
          color: Colors.pink,
          fontSize: 16.0,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _itemUI(index) {
    return Container(
      margin: EdgeInsets.only(top: 1.0),
      height: ScreenUtil().setHeight(330),
      width: ScreenUtil().setWidth(250),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(width: 0.5, color: Colors.black12),
        ),
      ),
      child: Column(
        children: <Widget>[
          Image.network(
            index['image'],
            fit: BoxFit.fill,
          ),
          Text(
            index['mallPrice'].toString(),
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          Text(
            index['price'].toString(),
            style: TextStyle(
                fontSize: 12.0,
                decoration: TextDecoration.lineThrough,
                color: Colors.black12),
          ),
        ],
      ),
    );
  }

  Widget _productList() {
    return Container(
      height: ScreenUtil().setHeight(320),
      child: ListView(
        scrollDirection: Axis.horizontal,
        semanticChildCount: recommendList.length,
        children: recommendList.map((index) {
          return _itemUI(index);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(403),
      child: Column(
        children: <Widget>[_topWidget(), _productList()],
      ),
    );
  }
}

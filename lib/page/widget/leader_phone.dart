import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {
  final String leaderPhone;
  final String leaderImage;

  LeaderPhone({Key key, this.leaderPhone, this.leaderImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _callPhone,
      child: Image.network(leaderImage, fit: BoxFit.cover),
    );
  }

  void _callPhone() async{
    String callPhone = 'tel:$leaderPhone';
    if(await canLaunch(callPhone)){
      await launch(callPhone);
    }else{
      throw "错误url launch $leaderPhone";
    }
  }
}

import 'package:flutter/material.dart';

class AdvBanner extends StatelessWidget {
  final String adv_url;

  AdvBanner({Key key, this.adv_url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adv_url, fit: BoxFit.cover),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  static String routeName = '/detail';

  final String appId;

  DetailPage(this.appId);

  @override
  State<StatefulWidget> createState() {
    return DetailState(appId: this.appId);
  }
}

class DetailState extends State<DetailPage> {

  final String appId;

  DetailState({Key key, this.appId}) {
    print("appId : " + this.appId);
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
          ],
        ),
        elevation: 0,
        centerTitle: false,
      ),

      body: Text("data"),
    );
  }

}

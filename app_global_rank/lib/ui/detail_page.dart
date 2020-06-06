import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:rank/model/country.dart';

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
          children: <Widget>[],
        ),
        elevation: 0,
        centerTitle: false,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _requestData(
            appId,
            Provider.of<CountryModel>(
              context,
              listen: false,
            ).country()),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _body(snapshot.data[0]);
          } else {
            return Container(
              color: Color.fromRGBO(255, 255, 255, 65),
              child: Center(
                child: LoadingJumpingLine.circle(
                  duration: const Duration(milliseconds: 1000),
                  backgroundColor: Colors.lightBlue,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Padding _body(Map<String,dynamic> appInfo) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _header(appInfo),
            Divider(),
            _function(appInfo),
            Divider(),
            _images(appInfo),
            Divider(),
            _content(appInfo),
            Divider(),
            _info(appInfo),
          ],
        ),
      ),
    );
  }

  _header(Map<String,dynamic> appInfo) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              appInfo["artworkUrl100"],
              width: 96,
              height: 96,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    appInfo["trackName"],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      appInfo["bundleId"],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400],
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "评分：" + appInfo["averageUserRating"].toString(),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _function(Map<String,dynamic> appInfo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 8),
            child: Text(
              "新功能",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "版本 " + appInfo["version"],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
              ),
              Text(
                appInfo["currentVersionReleaseDate"],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              appInfo["releaseNotes"],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }

  _images(Map<String,dynamic> appInfo) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 4),
            child: Text(
              "浏览",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                    appInfo["screenshotUrls"][index],
                  ),
                );
              },
              itemCount: appInfo["screenshotUrls"].length,
            ),
          )
        ],
      ),
    );
  }

  _content(Map<String,dynamic> appInfo) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        appInfo["description"],
        style: TextStyle(),
      ),
    );
  }

  _info(Map<String,dynamic> appInfo) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 128),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 0, bottom: 8),
            child: Text(
              "信息",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: _InfoWidget(
                    title: "供应商",
                    content: appInfo["artistName"],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _InfoWidget(
                  title: "价格",
                  content: appInfo["formattedPrice"],
                ),
                _InfoWidget(
                  title: "大小",
                  content: appInfo["fileSizeBytes"],
                ),
                _InfoWidget(
                  title: "年龄分级",
                  content: appInfo["contentAdvisoryRating"],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<List<dynamic>> _requestData(String appId, String country) async {
    var url =
        "https://itunes.apple.com/lookup?id=" + appId + "&country=" + country;
    print(url);
    var response = await Dio().get(url);
    var result = json.decode(response.data);

    return result["results"];
  }
}

class _InfoWidget extends StatelessWidget {
  final String title;
  final String content;

  const _InfoWidget({Key key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: Colors.grey[500]),
        ),
        Text(
          content,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

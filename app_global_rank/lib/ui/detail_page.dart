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
          children: <Widget>[],
        ),
        elevation: 0,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _header(),
              Divider(),
              _function(),
              Divider(),
              _images(),
              Divider(),
              _content(),
              Divider(),
              _info(),
            ],
          ),
        ),
      ),
    );
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            "https://www.smemo.info/icon.png",
            width: 96,
            height: 96,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "抖音短视频",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      "com.ss.iphone.ugc.Aweme.sdfsdfsdfsdfsdf",
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
                      "评分：5.6",
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

  _function() {
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
                "版本 11.3.0",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
              ),
              Text(
                "2020-06-03T11:29:27Z",
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
              "1.2.0版本更新\n\n【更新与调整】\n- 修正了其他的一些问题",
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

  _images() {
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
                    "https://is5-ssl.mzstatic.com/image/thumb/Purple113/v4/33/b5/85/33b58528-e927-3d6a-bfbb-6a4d83779a67/pr_source.jpg/406x228bb.jpg",
                  ),
                );
              },
              itemCount: 6,
            ),
          )
        ],
      ),
    );
  }

  _content() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        "时间规划局是一款提醒事项与时间管理的App，\nQQ：1217619769",
        style: TextStyle(),
      ),
    );
  }

  _info() {
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
                    content:
                        "Zhejiang Secret Magic Cube Network Technology Co., Ltd",
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
                  content: "免费",
                ),
                _InfoWidget(
                  title: "大小",
                  content: "123MB",
                ),
                _InfoWidget(
                  title: "年龄分级",
                  content: "12+",
                ),
              ],
            ),
          ),
        ],
      ),
    );
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

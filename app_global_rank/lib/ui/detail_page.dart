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
                      "评分：4.92624",
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
              "1.2.0版本更新\n\n【更新与调整】\n- DLC「深入黑雾」正式上架。\n\n- 支持iPad Pro 2018及以上设备的120Hz刷新率画面\n\n- 调整了部分角色的天赋效果和数值\n\n【问题修正】\n- 修正了部分怪物攻击判定时间过长的问题\n\n- 修正了一些文本描述的问题\n\n- 修正了其他的一些问题",
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
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.network(
                    "https://is5-ssl.mzstatic.com/image/thumb/Purple114/v4/c0/85/ea/c085ea56-eee9-5680-cf16-5488f523f541/pr_source.png/392x696bb.png",
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
      padding: const EdgeInsets.only(top: 16, bottom: 48),
      child: Text(
        "时间规划局是一款提醒事项与时间管理的App，它会时刻提醒你珍惜自己的时间，可以精确到秒。支持农历显示，支持分类管理功能，支持自定义小组件背景，支持百分比形式，支持更改百分比的精确度，让您每分每秒都能够看到时间的变化，提醒您珍惜时间。同时支持『CPU面板』，『整点报时』，『年龄计算器』，『全屏时钟』，『日期计算器』，『二维码生成』等小工具。\n\n它可以帮你制定项目计划、设置会议的提醒、 安排您的行程规划、并让您保持工作专注，还能用于记录备忘事件，帮组您更好的管理时间。\n\n[特色]\n# 可以精确到秒，时刻提醒您珍惜时间，看得到的时间变化;\n# 支持提醒，通过推送通知提醒您即将到期的事件；\n# 支持动态壁纸；\n# 支持农历选择，不错过每一个农历节日；\n# 可自定义小组件背景，自定义小组件颜色，个性化定义小组件；\n# 支持每天每周每月每年重新计算；\n# 内置多个小工具，包括『CPU面板』，『整点报时』，『年龄计算器』，『全屏时钟』，『日期计算器』，『二维码生成』等多个小工具；\n# 支持事件置顶；\n# 支持事件自动排序；\n# 支持分类管理功能，更好的帮您管理所有事件提醒；\n# 您可为每个事件设置背景，小而美的时间提醒应用；\n# 支持将数据备份到iCloud的功能，再也不用担心数据会丢失；\n# 提供各种炫酷的动画，给您不一样的心情；\n# 可自定义推送通知铃声，让您与众不同；\n# 全新清新简洁的操作界面，让操作更简洁；\n# 支持百分比形式。\n如果您有任何问题请联系我们：\nQQ：1217619769",
        style: TextStyle(),
      ),
    );
  }
}

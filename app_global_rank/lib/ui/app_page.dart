import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:rank/generated/l10n.dart';
import 'package:rank/widgets/app_item_widget.dart';

class AppPage extends StatefulWidget {
  static String routeName = '/app';

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<AppPage> {
  List<dynamic> _appList = List<dynamic>();

  int _bottomSelectedIndex = 2;

  bool _isLoading = false;

  Dio dio = Dio();

  AppState() {
    dio.interceptors.add(
      DioCacheManager(
        CacheConfig(),
      ).interceptor,
    );
  }

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                S.of(context).rank,
                style: TextStyle(fontSize: 36),
              ),
            ),
            GestureDetector(
              onTap: () => {_selectCountry()},
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "「中国」",
                  style: TextStyle(fontSize: 16, color: Colors.grey[400]),
                ),
              ),
            )
          ],
        ),
        elevation: 0,
        centerTitle: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.pets), title: Text(S.of(context).newApp)),
          BottomNavigationBarItem(
              icon: Icon(Icons.games), title: Text(S.of(context).newGame)),
          BottomNavigationBarItem(
              icon: Icon(Icons.apps), title: Text(S.of(context).topFree)),
          BottomNavigationBarItem(
              icon: Icon(Icons.redeem), title: Text(S.of(context).topGrossing)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text(S.of(context).topPaid)),
        ],
        currentIndex: _bottomSelectedIndex,
        onTap: (index) => {_bottomClick(index)},
        unselectedFontSize: 10,
        selectedFontSize: 12,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Colors.grey[50],
        selectedIconTheme: IconThemeData(color: Colors.lightBlue),
        unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
        type: BottomNavigationBarType.fixed,
      ),
      body: Stack(
        children: <Widget>[
          _buildListView(),
          _getLoading(),
        ],
      ),
    );
  }

  _getLoading() {
    if (_isLoading) {
      return Container(
        color: Color.fromRGBO(255, 255, 255, 65),
        child: Center(
          child: LoadingJumpingLine.circle(
            duration: const Duration(milliseconds: 1000),
            backgroundColor: Colors.lightBlue,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  final _controller = ScrollController();

  ListView _buildListView() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemExtent: 88,
      controller: _controller,
      itemBuilder: (BuildContext context, int index) {
        return _itemWidget(index);
      },
      itemCount: _appList.length,
    );
  }

  _bottomClick(index) {
    setState(() {
      _bottomSelectedIndex = index;
    });
    _requestData();
  }

  _itemWidget(int index) {
    var item = _appList[index];
    return AppItemWidget(context: context, index: index, item: item);
  }

  _requestData() async {
    setState(() {
      _isLoading = true;
    });
    print("request");
    var url = _getRequestUrl();
    var response = await dio.get(
      url,
      options: buildCacheOptions(
        Duration(hours: 2),
        maxStale: Duration(days: 1),
      ),
    );
    setState(() {
      _appList = response.data["feed"]["results"];
      _isLoading = false;
      _controller.jumpTo(0);
    });
  }

  String _getRequestUrl() {
    var country = "cn";
    var url = "";
    switch (_bottomSelectedIndex) {
      case 0:
        {
          url = "https://rss.itunes.apple.com/api/v1/" +
              country +
              "/ios-apps/new-apps-we-love/all/100/explicit.json";
        }
        break;
      case 1:
        {
          url = "https://rss.itunes.apple.com/api/v1/" +
              country +
              "/ios-apps/new-games-we-love/all/100/explicit.json";
        }
        break;
      case 2:
        {
          url = "https://rss.itunes.apple.com/api/v1/" +
              country +
              "/ios-apps/top-free/all/100/explicit.json";
        }
        break;
      case 3:
        {
          url = "https://rss.itunes.apple.com/api/v1/" +
              country +
              "/ios-apps/top-grossing/all/100/explicit.json";
        }
        break;
      case 4:
        {
          url = "https://rss.itunes.apple.com/api/v1/" +
              country +
              "/ios-apps/top-paid/all/100/explicit.json";
        }
        break;
      default:
        {
          url = "https://rss.itunes.apple.com/api/v1/" +
              country +
              "/ios-apps/top-free/all/100/explicit.json";
        }
    }
    return url;
  }

  _selectCountry() {
    print("select country");
  }
}

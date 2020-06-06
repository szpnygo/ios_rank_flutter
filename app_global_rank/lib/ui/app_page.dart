import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:rank/ui/detail_page.dart';

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
                "排行榜",
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
          BottomNavigationBarItem(icon: Icon(Icons.pets), title: Text("新鲜App")),
          BottomNavigationBarItem(icon: Icon(Icons.games), title: Text("本周新游")),
          BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text("免费排行")),
          BottomNavigationBarItem(
              icon: Icon(Icons.redeem), title: Text("畅销排行")),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text("付费排行")),
        ],
        currentIndex: _bottomSelectedIndex,
        onTap: (index) => {_bottomClick(index)},
        unselectedFontSize: 12,
        selectedFontSize: 14,
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
    return InkWell(
      onTap: () => {
        Navigator.of(context).push(
          new PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 200),
            pageBuilder: (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
              return FadeTransition(
                //使用渐隐渐入过渡,
                opacity: animation,
                child: DetailPage(item["id"]), //路由B
              );
            },
          ),
        ),
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 32, right: 32, top: 12, bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: item["artworkUrl100"],
                width: 64,
                height: 64,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 2),
              child: Text(
                (index + 1).toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item["name"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        item["genres"][0]["name"],
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
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

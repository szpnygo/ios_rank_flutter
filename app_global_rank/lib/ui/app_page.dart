import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:rank/generated/l10n.dart';
import 'package:rank/model/country.dart';
import 'package:rank/widgets/app_item_widget.dart';
import 'package:intl/intl.dart';

class AppPage extends StatefulWidget {
  static String routeName = '/app';

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<AppPage> {

  List<String> _countryList = [
    "us",
    "gb",
    "jp",
    "de",
    "fr",
    "cn",
    "hk",
    "tw",
    "mo",
    "br",
    "dk",
    "eg",
    "n_in",
    "th",
    "vn",
    "kr",
    "fi",
    "it",
    "bh",
    "bj",
    "bt",
    "bn",
    "td",
    "cl",
    "fj",
    "gh",
    "gr",
    "ru",
    "jo",
    "la",
    "ml",
    "mn",
    "nl",
    "no",
    "om",
    "pw",
    "pe",
    "pl",
    "ch",
    "za",
    "ar",
    "ca",
    "il",
    "ph",
    "se",
    "ye",
    "n_is",
    "ao",
    "bs",
    "be",
    "bz",
    "bm",
    "kh",
    "cv",
    "es",
    "gm",
    "gy",
    "ie",
    "jm",
    "ke",
    "kw",
    "lb",
    "lt",
    "lu",
    "mk",
    "hu",
    "mw",
    "mt",
    "mx",
    "np",
    "nz",
    "ne",
    "at",
    "pa",
    "py",
    "sg",
    "pt",
    "sc",
    "sr",
    "tn",
    "tr",
    "ug",
    "qa",
    "ae",
    "ua",
    "uy",
    "ai",
    "am",
    "au",
    "az",
    "bb",
    "by",
    "bo",
    "bw",
    "ky",
    "co",
    "cy",
    "dm",
    "ec",
    "ee",
    "sv",
    "gd",
    "gt",
    "hn",
    "hr",
    "lv",
    "lr",
    "my",
    "mu",
    "md",
    "mz",
    "na",
    "ni",
    "ng",
    "pk",
    "ro",
    "lc",
    "sn",
    "sl",
    "sk",
    "lk",
    "sz",
    "tz",
    "ve",
    "zw",
    "bg",
    "al",
    "dz",
    "bf",
    "cg",
    "cr",
    "cz",
    "gw",
    "id",
    "kz",
    "mg",
    "mr",
    "ms",
    "sa",
    "si",
    "sb",
    "tj",
    "tm",
    "kg",
    "uz",
    "ag",
    "pg",
    "n_do",
    "kn",
    "vg",
    "fm",
    "st",
    "tt",
    "tc",
    "vc"
  ];

  List<dynamic> _appList = List<dynamic>();

  int _bottomSelectedIndex = 2;

  bool _isLoading = false;

  Dio dio = Dio();

  String country = "us";

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
    setState(() {
      country = Provider.of<CountryModel>(
        context,
        listen: false,
      ).country();
    });

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
                  "「" + Intl.message(country, name: country) + "」",
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
    var url = "";
    var urlCountry = country;
    if (urlCountry.startsWith("n_")) {
      urlCountry = urlCountry.replaceAll("n_", "");
    }
    switch (_bottomSelectedIndex) {
      case 0:
        {
          url = "https://rss.itunes.apple.com/api/v1/" +
              urlCountry +
              "/ios-apps/new-apps-we-love/all/100/explicit.json";
        }
        break;
      case 1:
        {
          url = "https://rss.itunes.apple.com/api/v1/" +
              urlCountry +
              "/ios-apps/new-games-we-love/all/100/explicit.json";
        }
        break;
      case 2:
        {
          url = "https://rss.itunes.apple.com/api/v1/" +
              urlCountry +
              "/ios-apps/top-free/all/100/explicit.json";
        }
        break;
      case 3:
        {
          url = "https://rss.itunes.apple.com/api/v1/" +
              urlCountry +
              "/ios-apps/top-grossing/all/100/explicit.json";
        }
        break;
      case 4:
        {
          url = "https://rss.itunes.apple.com/api/v1/" +
              urlCountry +
              "/ios-apps/top-paid/all/100/explicit.json";
        }
        break;
      default:
        {
          url = "https://rss.itunes.apple.com/api/v1/" +
              urlCountry +
              "/ios-apps/top-free/all/100/explicit.json";
        }
    }
    return url;
  }

  int _selectedIndex = 0;

  _selectCountry() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: 360,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    controller: ScrollController(initialScrollOffset: 40 * _selectedIndex.toDouble()),
                    itemExtent: 40,
                    itemBuilder: (BuildContext context, int index) {
                      return _CountryWidget(
                        title: Intl.message(
                          _countryList[index],
                          name: _countryList[index],
                        ),
                        selected: _countryList[index] == country,
                        onTap: () => {_clickCountry(index)},
                      );
                    },
                    itemCount: _countryList.length,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  _clickCountry(int index) {
    _selectedIndex = index;
    Navigator.pop(context);
    setState(() {
      country = _countryList[index];
      Provider.of<CountryModel>(
        context,
        listen: false,
      ).changeCountry(country);
      _requestData();
    });
  }
}

class _CountryWidget extends StatelessWidget {
  final String title;
  final bool selected;
  final GestureTapCallback onTap;

  const _CountryWidget({Key key, this.title, this.selected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Colors.grey;
    var weight = FontWeight.normal;
    if (selected) {
      color = Colors.blue;
      weight = FontWeight.bold;
    }
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: weight,
          ),
        ),
      ),
    );
  }
}

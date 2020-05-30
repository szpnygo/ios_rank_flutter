import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  static String routeName = '/app';

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<AppPage> {
  int _bottomSelectedIndex = 2;

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
              onTap: () => {print("ssss")},
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
        onTap: (index) => {
          setState(() {
            _bottomSelectedIndex = index;
          })
        },
        unselectedFontSize: 12,
        selectedFontSize: 14,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Colors.grey[50],
        selectedIconTheme: IconThemeData(color: Colors.lightBlue),
        unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
        type: BottomNavigationBarType.fixed,
      ),
      body: Text("data"),
    );
  }
}

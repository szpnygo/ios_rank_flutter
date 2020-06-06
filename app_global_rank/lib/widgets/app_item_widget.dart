
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rank/ui/detail_page.dart';

class AppItemWidget extends StatelessWidget {
  final int index;
  final BuildContext context;
  final item;

  const AppItemWidget({
    Key key,
    @required this.index,
    @required this.context,
    @required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String content;

  const InfoWidget({Key key, this.title, this.content}) : super(key: key);

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

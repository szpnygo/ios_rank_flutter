import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {

  final String url;

  const ImageItemWidget({
    Key key,
    @required this.url
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CachedNetworkImage(
        imageUrl: url,
      ),
    );
  }
}
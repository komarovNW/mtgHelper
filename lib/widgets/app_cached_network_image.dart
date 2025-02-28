import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({super.key, required String url}) : _url = url;

  final String _url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
      ),
      child: CachedNetworkImage(
        imageUrl: _url,
        placeholder: (BuildContext context, String url) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.grey[300]!, Colors.grey[200]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        ),
        errorWidget: (BuildContext context, String url, Object error) =>
            const Icon(Icons.error),
      ),
    );
  }
}

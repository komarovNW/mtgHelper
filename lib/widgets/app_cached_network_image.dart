import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum ImageSize {
  large(double.infinity, 500, 16),
  small(null, 270, 8);

  const ImageSize(this.width, this.height, this.borderRadius);

  final double? width;
  final double? height;
  final double borderRadius;
}

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required String url,
    required ImageSize size,
  })  : _url = url,
        _size = size;

  final String _url;
  final ImageSize _size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(_size.borderRadius),
        topRight: Radius.circular(_size.borderRadius),
      ),
      child: CachedNetworkImage(
        imageUrl: _url,
        width: _size.width,
        fit: BoxFit.fitWidth,
        height: _size.height,
        placeholder: (BuildContext context, String url) => Container(
          width: _size.width,
          height: _size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.grey[300]!, Colors.grey[200]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(_size.borderRadius),
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

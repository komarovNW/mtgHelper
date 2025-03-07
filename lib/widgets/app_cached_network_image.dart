import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mtg_helper/widgets/app_loader.dart';

enum ImageSize {
  large(double.infinity, 500, 16),
  small(null, 270, 8),
  medium(60, 80, 0);

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
    bool needFavoriteIcon = false,
    bool isFavoriteIcon = false,
    VoidCallback? onPressedFavoriteIcon,
  })  : _url = url,
        _size = size,
        _needFavoriteIcon = needFavoriteIcon,
        _isFavoriteIcon = isFavoriteIcon,
        _onPressedFavoriteIcon = onPressedFavoriteIcon;

  final String _url;
  final ImageSize _size;
  final bool _needFavoriteIcon;
  final bool _isFavoriteIcon;
  final VoidCallback? _onPressedFavoriteIcon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(_size.borderRadius),
        topRight: Radius.circular(_size.borderRadius),
      ),
      child: Stack(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: _url,
            width: _size.width,
            fit: BoxFit.fitWidth,
            height: _size.height,
            placeholder: (BuildContext context, String url) => _size ==
                    ImageSize.medium
                ? const SizedBox.shrink()
                : Container(
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
                    child: const AppLoader(),
                  ),
            errorWidget: (BuildContext context, String url, Object error) =>
                const Icon(Icons.error),
          ),
          if (_needFavoriteIcon)
            Positioned(
              top: 10,
              right: 10,
              child: FavoriteIconButton(
                isFavorite: _isFavoriteIcon,
                onPressed: _onPressedFavoriteIcon,
              ),
            ),
        ],
      ),
    );
  }
}

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    super.key,
    required this.isFavorite,
    this.onPressed,
  });

  final bool isFavorite;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: 30,
        color: isFavorite ? const Color(0xffF45D01) : null,
      ),
    );
  }
}

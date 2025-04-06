import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mtg_helper/widgets/app_favorite_icon_button.dart';
import 'package:mtg_helper/widgets/app_loader.dart';

enum ImageSize {
  large(double.infinity, 500, 16),
  small(null, 270, 8),
  medium(60, 100, 0);

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
    bool canOpenFullScreen = false,
    VoidCallback? onPressedFavoriteIcon,
  })  : _url = url,
        _size = size,
        _needFavoriteIcon = needFavoriteIcon,
        _isFavoriteIcon = isFavoriteIcon,
        _canOpenFullScreen = canOpenFullScreen,
        _onPressedFavoriteIcon = onPressedFavoriteIcon;

  final String _url;
  final ImageSize _size;
  final bool _needFavoriteIcon;
  final bool _isFavoriteIcon;
  final bool _canOpenFullScreen;
  final VoidCallback? _onPressedFavoriteIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _canOpenFullScreen
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) =>
                      _FullScreenImageScreen(url: _url),
                ),
              );
            }
          : null,
      child: Hero(
        tag: _url,
        child: ClipRRect(
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
                placeholder: (BuildContext context, String url) =>
                    _size == ImageSize.medium
                        ? const SizedBox.shrink()
                        : Container(
                            width: _size.width,
                            height: _size.height,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Colors.grey[300]!,
                                  Colors.grey[200]!,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius:
                                  BorderRadius.circular(_size.borderRadius),
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
                  child: AppFavoriteIconButton(
                    isFavorite: _isFavoriteIcon,
                    onPressed: _onPressedFavoriteIcon,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FullScreenImageScreen extends StatelessWidget {
  const _FullScreenImageScreen({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Hero(
            tag: url,
            child: InteractiveViewer(
              child: CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.contain,
                placeholder: (BuildContext context, String url) =>
                    const AppLoader(),
                errorWidget: (BuildContext context, String url, Object error) =>
                    const Icon(Icons.error, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FullScreenImageScreen extends StatelessWidget {
  const FullScreenImageScreen({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Hero(
            tag: url,
            child: InteractiveViewer(
              child: CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.contain,
                placeholder: (BuildContext context, String url) =>
                    const AppLoader(),
                errorWidget: (BuildContext context, String url, Object error) =>
                    const Icon(Icons.error, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

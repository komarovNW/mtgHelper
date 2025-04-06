import 'package:flutter/material.dart';

class AppFavoriteIconButton extends StatelessWidget {
  const AppFavoriteIconButton({
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

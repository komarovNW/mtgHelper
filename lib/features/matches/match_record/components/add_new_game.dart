import 'package:flutter/material.dart';

class AddNewGameButton extends StatelessWidget {
  const AddNewGameButton({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff474647),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(8),
        ),
        child: const Text(
          '+',
          style: TextStyle(
            fontSize: 16,
            color: Color(
              0xffF45D01,
            ),
          ),
        ),
      ),
    );
  }
}

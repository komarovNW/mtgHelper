import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization_extension.dart';

class AppSearchTextFormField extends StatelessWidget {
  const AppSearchTextFormField({
    super.key,
    required TextEditingController searchController,
    required VoidCallback onTapIcon,
    required Function(String) onChange,
  })  : _searchController = searchController,
        _onTap = onTapIcon,
        _onChange = onChange;

  final TextEditingController _searchController;
  final VoidCallback _onTap;
  final Function(String) _onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchController,
      keyboardType: TextInputType.text,
      style: const TextStyle(color: Colors.white),
      onChanged: (String query) => _onChange(query),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        hintText: context.l10n.auctionHintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xffF45D01),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Color(0xffF45D01),
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: _onTap,
          child: const Icon(
            Icons.close_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

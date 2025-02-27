import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization.dart';

class PriceSearchTextFormField extends StatelessWidget {
  const PriceSearchTextFormField({
    super.key,
    required TextEditingController searchController,
    required VoidCallback onTapIcon,
    required Function(String) test,
  })  : _searchController = searchController,
        _onTap = onTapIcon,
        _test = test;

  final TextEditingController _searchController;
  final VoidCallback _onTap;
  final Function(String) _test;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: TextFormField(
        controller: _searchController,
        style: const TextStyle(color: Colors.white),
        onChanged: (String query) => _test(query),
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
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}

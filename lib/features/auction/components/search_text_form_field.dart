import 'package:flutter/material.dart';
import 'package:mtg_helper/extension/localization.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required TextEditingController searchController,
    required VoidCallback onTapIcon,
  })  : _searchController = searchController,
        _onTap = onTapIcon;

  final TextEditingController _searchController;
  final VoidCallback _onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: context.l10n.auctionHintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: InkWell(
          onTap: _onTap,
          child: const Icon(
            Icons.close_outlined,
            color: Colors.black,
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

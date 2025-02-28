import 'package:flutter/material.dart';
import 'package:mtg_helper/widgets/app_text_form_field.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    TextEditingController? searchController,
    VoidCallback? onTapIcon,
    Function(String)? onChange,
    String? title,
  })  : _searchController = searchController,
        _onTap = onTapIcon,
        _onChange = onChange,
        _title = title,
        preferredSize = const Size.fromHeight(kToolbarHeight);

  final TextEditingController? _searchController;
  final VoidCallback? _onTap;
  final Function(String)? _onChange;
  final String? _title;
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 70.0,
      titleSpacing: 0,
      floating: true,
      snap: true,
      leading: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xffF45D01),
      ),
      backgroundColor: const Color(0xff474647),
      title: _title != null
          ? Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                _title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 16.0),
              child: AppTextFormField(
                searchController: _searchController!,
                onChange: _onChange!,
                onTapIcon: _onTap!,
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mtg_helper/utils/auth_notifier.dart';
import 'package:mtg_helper/widgets/app_text_form_field.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar({
//     super.key,
//     this.searchController,
//     this.onTapIcon,
//     this.onChange,
//     this.title,
//     this.bottom,
//     this.needBackButton = false,
//     this.needExitButton = false,
//   }) : preferredSize = const Size.fromHeight(kToolbarHeight);
//
//   final TextEditingController? searchController;
//   final VoidCallback? onTapIcon;
//   final Function(String)? onChange;
//   final String? title;
//   final PreferredSizeWidget? bottom;
//   final bool needBackButton;
//   final bool needExitButton;
//
//   @override
//   final Size preferredSize;
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       bottom: bottom,
//       expandedHeight: 65.0,
//       titleSpacing: 0,
//       floating: true,
//       snap: true,
//       leading: needBackButton ? _buildBackButton(context) : DrawerIcon(),
//       iconTheme: const IconThemeData(
//         color: Color(0xffF45D01),
//       ),
//       backgroundColor: const Color(0xff474647),
//       title: _buildTitle(),
//       actions: needExitButton
//           ? <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(top: 12.0),
//                 child: IconButton(
//                   icon: const Icon(Icons.exit_to_app),
//                   onPressed: () => context.read<AuthNotifier>().signOut(),
//                 ),
//               ),
//             ]
//           : null,
//     );
//   }
//
//   // Widget _buildMenuButton(BuildContext context) {
//   //   return Builder(
//   //     builder: (BuildContext context) => Padding(
//   //       padding: const EdgeInsets.only(top: 12.0),
//   //       child: IconButton(
//   //         icon: const Icon(Icons.menu),
//   //         onPressed: () {
//   //           Scaffold.of(context).openDrawer();
//   //         },
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   /// TODO должен быть pop
//   Widget _buildBackButton(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 12.0),
//       child: IconButton(
//         icon: const Icon(Icons.arrow_back_ios_new),
//         onPressed: () => context.go('/search'),
//       ),
//     );
//   }
//
//   Widget _buildTitle() {
//     if (title != null) {
//       return Padding(
//         padding: const EdgeInsets.only(top: 12.0),
//         child: Text(
//           title!,
//           style: const TextStyle(color: Colors.white),
//         ),
//       );
//     }
//
//     if (searchController != null && onChange != null && onTapIcon != null) {
//       return Padding(
//         padding: const EdgeInsets.only(top: 8.0, right: 16.0),
//         child: AppTextFormField(
//           searchController: searchController!,
//           onChange: onChange!,
//           onTapIcon: onTapIcon!,
//         ),
//       );
//     }
//
//     return const SizedBox();
//   }
// }
//
// class DrawerIcon extends StatelessWidget {
//   const DrawerIcon({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (BuildContext context) {
//         return Padding(
//           padding: const EdgeInsets.only(top: 12.0),
//           child: IconButton(
//             icon: const Icon(Icons.menu),
//             onPressed: () {
//               final ScaffoldState? scaffold = Scaffold.maybeOf(context);
//               if (scaffold != null && scaffold.hasDrawer) {
//                 scaffold.openDrawer();
//               }
//             },
//           ),
//         );
//       },
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mtg_helper/utils/auth_notifier.dart';
// import 'package:mtg_helper/widgets/app_text_form_field.dart';

const Color _iconColor = Color(0xffF45D01);
const Color _backgroundColor = Color(0xff474647);

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.searchController,
    this.onTapIcon,
    this.onChange,
    this.title,
    this.bottom,
    this.needBackButton = false,
    this.needExitButton = false,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);

  final TextEditingController? searchController;
  final VoidCallback? onTapIcon;
  final Function(String)? onChange;
  final String? title;
  final PreferredSizeWidget? bottom;
  final bool needBackButton;
  final bool needExitButton;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      bottom: bottom,
      expandedHeight: 65.0,
      titleSpacing: 0,
      floating: true,
      snap: true,
      leading: needBackButton ? const BackButtonWidget() : const DrawerIcon(),
      iconTheme: const IconThemeData(color: _iconColor),
      backgroundColor: _backgroundColor,
      title: title != null
          ? TitleWidget(title: title!)
          : searchController != null && onChange != null && onTapIcon != null
              ? SearchField(
                  searchController: searchController!,
                  onChange: onChange!,
                  onTapIcon: onTapIcon!,
                )
              : null,
      actions: needExitButton ? const <Widget>[ExitButton()] : null,
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go('/search');
          }
        },
      ),
    );
  }
}

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            final ScaffoldState? scaffold = Scaffold.maybeOf(context);
            if (scaffold != null && scaffold.hasDrawer) {
              scaffold.openDrawer();
            }
          },
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchController,
    required this.onChange,
    required this.onTapIcon,
  });
  final TextEditingController searchController;
  final Function(String) onChange;
  final VoidCallback onTapIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 16.0),
      child: AppTextFormField(
        searchController: searchController,
        onChange: onChange,
        onTapIcon: onTapIcon,
      ),
    );
  }
}

class ExitButton extends StatelessWidget {
  const ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: IconButton(
        icon: const Icon(Icons.exit_to_app),
        onPressed: () => context.read<AuthNotifier>().signOut(),
      ),
    );
  }
}

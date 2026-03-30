import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onPlusTap;
  final VoidCallback? onProfileTap;
  final int currentIndex;
  final bool isBottom;

  const CustomAppBar({
    super.key,
    this.onHomeTap,
    this.onPlusTap,
    this.onProfileTap,
    this.currentIndex = 0,
    this.isBottom = false,
  });

  String _getIcon(String baseName, bool isActive) {
    return 'assets/images/icons/${baseName}${isActive ? "_active" : ""}.svg';
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = 16.0;

    final navRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(_getIcon('home', currentIndex == 0)),
          onPressed: onHomeTap,
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset('assets/images/icons/plus.svg'),
          onPressed: onPlusTap,
        ),
        IconButton(
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(_getIcon('profile', currentIndex == 1)),
          onPressed: onProfileTap,
        ),
      ],
    );

    if (isBottom) {
      return SafeArea(
        child: Container(
          height: 56,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: navRow,
        ),
      );
    }

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: navRow,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(isBottom ? 56 : kToolbarHeight);
}

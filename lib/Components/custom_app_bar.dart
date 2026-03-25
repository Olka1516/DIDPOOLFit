import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onPlusTap;
  final VoidCallback? onProfileTap;
  final int currentIndex;

  const CustomAppBar({
    super.key,
    this.onHomeTap,
    this.onPlusTap,
    this.onProfileTap,
    this.currentIndex = 0,
  });

  String _getIcon(String baseName, bool isActive) {
    return 'assets/images/icons/${baseName}${isActive ? "_active" : ""}.svg';
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    final horizontalPadding = isMobile ? 16.0 : 104.0;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Row(
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
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

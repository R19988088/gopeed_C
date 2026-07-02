import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class DesktopHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopHomeAppBar({
    super.key,
    this.title,
    this.bottom,
    this.showTitle = true,
    this.showBack = false,
    this.showMenu = true,
  });

  final String? title;
  final PreferredSizeWidget? bottom;
  final bool showTitle;
  final bool showBack;
  final bool showMenu;

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? 56 : 92);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: bottom == null ? 56 : 44,
      title: showTitle ? Text(title ?? 'Gopeed') : null,
      centerTitle: true,
      elevation: bottom == null ? null : 4,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.rootDelegate.offAndToNamed(Routes.TASK),
            )
          : null,
      actions: [
        if (showMenu)
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () => Get.rootDelegate.offAndToNamed(Routes.EXTENSION),
          ),
      ],
      bottom: bottom,
    );
  }
}

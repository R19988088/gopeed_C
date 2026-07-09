import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import '../routes/app_pages.dart';

class DesktopHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopHomeAppBar({
    super.key,
    this.title,
    this.bottom,
    this.showTitle = true,
    this.showBack = false,
    this.showMenu = false,
    this.onMenuTap,
  });

  final String? title;
  final PreferredSizeWidget? bottom;
  final bool showTitle;
  final bool showBack;
  final bool showMenu;
  final VoidCallback? onMenuTap;

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? 56 : 104);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 56,
      title: showTitle
          ? DragToMoveArea(
              child: SizedBox(
                height: 56,
                child: Center(child: Text(title ?? 'Gopeed')),
              ),
            )
          : null,
      centerTitle: true,
      elevation: bottom == null ? null : 4,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Get.rootDelegate.offAndToNamed(Routes.TASK),
            )
          : null,
      actions: [
        if (showMenu || onMenuTap != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 9),
            child: Align(
              alignment: Alignment.topCenter,
              child: IconButton(
                icon: const Icon(Icons.menu),
                onPressed:
                    onMenuTap ?? () => Get.rootDelegate.offAndToNamed(Routes.EXTENSION),
              ),
            ),
          ),
      ],
      bottom: bottom,
    );
  }
}

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
    this.showMenu = true,
  });

  final String? title;
  final PreferredSizeWidget? bottom;
  final bool showTitle;
  final bool showBack;
  final bool showMenu;

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
        if (showMenu)
          Padding(
            padding: const EdgeInsets.only(right: 9),
            child: Align(
              alignment: Alignment.topCenter,
              child: InkResponse(
                radius: 22,
                onTap: () => Get.rootDelegate.offAndToNamed(Routes.EXTENSION),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  child: const Icon(Icons.more_horiz),
                ),
              ),
            ),
          ),
      ],
      bottom: bottom,
    );
  }
}

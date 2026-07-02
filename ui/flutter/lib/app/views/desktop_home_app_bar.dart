import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class DesktopHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DesktopHomeAppBar({
    super.key,
    this.title,
    this.bottom,
  });

  final String? title;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(title ?? 'Gopeed'),
      centerTitle: true,
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.more_horiz),
          onSelected: (route) => Get.rootDelegate.offAndToNamed(route),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: Routes.EXTENSION,
              child: Text('extensions'.tr),
            ),
            PopupMenuItem(
              value: Routes.SETTING,
              child: Text('setting'.tr),
            ),
          ],
        ),
      ],
      bottom: bottom,
    );

    return appBar;
  }
}

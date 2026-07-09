import 'package:flutter/material.dart';

class DesktopPageSwitch extends StatelessWidget {
  const DesktopPageSwitch({
    super.key,
    required this.tabs,
    required this.onTap,
  });

  final List<String> tabs;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final titleColor = Theme.of(context).appBarTheme.titleTextStyle?.color ??
        Theme.of(context).textTheme.titleLarge?.color ??
        Theme.of(context).colorScheme.onSurface;
    final activeColor = Theme.of(context).colorScheme.tertiary;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 360,
        height: 42,
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          border: Border.all(color: activeColor),
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: TabBar(
          indicator: BoxDecoration(color: activeColor),
          labelColor: Colors.white,
          unselectedLabelColor: titleColor.withValues(alpha: 0.6),
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          tabs: tabs.map((label) => Tab(text: label)).toList(),
          onTap: onTap,
        ),
      ),
    );
  }
}

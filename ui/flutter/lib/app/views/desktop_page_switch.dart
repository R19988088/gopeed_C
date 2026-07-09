import 'dart:math' as math;

import 'package:flutter/material.dart';

class DesktopPageSwitch extends StatelessWidget {
  const DesktopPageSwitch({
    super.key,
    required this.tabs,
    required this.onTap,
    this.index = 0,
  });

  final List<String> tabs;
  final ValueChanged<int> onTap;
  final int index;

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
        child: Row(
          children: [
            for (var i = 0; i < tabs.length; i++)
              Expanded(
                child: InkWell(
                  onTap: () => onTap(i),
                  child: _FlippingTab(
                    label: tabs[i],
                    selected: index == i,
                    selectedColor: activeColor,
                    unselectedColor: titleColor.withValues(alpha: 0.6),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _FlippingTab extends StatelessWidget {
  const _FlippingTab({
    required this.label,
    required this.selected,
    required this.selectedColor,
    required this.unselectedColor,
  });

  final String label;
  final bool selected;
  final Color selectedColor;
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 180),
      transitionBuilder: (child, animation) {
        return AnimatedBuilder(
          animation: animation,
          child: child,
          builder: (context, child) {
            final angle = (1 - animation.value) * math.pi / 2;
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(angle),
              child: child,
            );
          },
        );
      },
      child: Container(
        key: ValueKey(selected),
        color: selected ? selectedColor : Colors.transparent,
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : unselectedColor,
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

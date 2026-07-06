import 'package:flutter/material.dart';

class DesktopPageSwitch extends StatelessWidget {
  const DesktopPageSwitch({
    super.key,
    required this.tabs,
    required this.onTap,
    required this.onAction,
  });

  final List<String> tabs;
  final ValueChanged<int> onTap;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFF3D7E3A);
    const shadow = [
      BoxShadow(
        color: Color(0x33000000),
        blurRadius: 5,
        offset: Offset(0, 2),
      ),
    ];

    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 360,
            height: 42,
            margin: const EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 1.5),
              borderRadius: BorderRadius.circular(10),
              boxShadow: shadow,
            ),
            clipBehavior: Clip.antiAlias,
            child: TabBar(
              indicator: const BoxDecoration(color: borderColor),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelStyle: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
              tabs: tabs.map((label) => Tab(text: label)).toList(),
              onTap: onTap,
            ),
          ),
          const SizedBox(width: 8),
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                border: Border.all(color: borderColor, width: 1.5),
                borderRadius: BorderRadius.circular(10),
                boxShadow: shadow,
              ),
              child: IconButton(
                icon: const Icon(Icons.more_horiz),
                onPressed: onAction,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

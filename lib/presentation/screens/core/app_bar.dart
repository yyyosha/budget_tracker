import 'package:budget_tracker/app/theme/sizes.dart';
import 'package:flutter/material.dart';

class BtAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BtAppBar({
    required this.title,
    required this.onBack,
    super.key,
  });

  final String title;
  final VoidCallback onBack;

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: AppSizes.appBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_left_outlined),
              iconSize: 30.0,
              onPressed: onBack,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(width: 48.0),
          ],
        ),
      ),
    );
  }
}

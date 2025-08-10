import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const BuildAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context), // ✅ actually pops the page
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

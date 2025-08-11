
import 'package:flutter/material.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool enableBackButton;
  final VoidCallback? onBackPressed;
  
  const BuildAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.enableBackButton = true,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: showBackButton 
        ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: enableBackButton 
              ? (onBackPressed ?? () => Navigator.pop(context))
              : null,
          )
        : null,
      automaticallyImplyLeading: showBackButton,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
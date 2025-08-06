import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/l10n/translation/app_localizations.dart';
import '../../../../../../core/theme/app_colors.dart';

class BuildCustomTextField extends StatelessWidget {
  final Function(String)? onChanged;
  const BuildCustomTextField({super.key,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return TextField(
      onChanged:  onChanged,
      decoration: InputDecoration(
        hintText: local.search_hint_text,
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: AppColors.gray),
        ),
      ),
    );
  }
}

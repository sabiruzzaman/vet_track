import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool showBackButton;
  final bool isGreen;
  final List<Widget>? actions;
  final VoidCallback? onBack; // <-- Add this

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.showBackButton = true,
    this.isGreen = false,
    this.actions,
    this.onBack, // <-- Allow override
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.primaryDark,),
              onPressed:
                  onBack ??
                  () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
            )
          : null,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: TextStyle(
          color: isGreen
              ? AppColors.primaryGreen
              : Theme.of(context).appBarTheme.titleTextStyle?.color,
          fontSize:
              Theme.of(context).appBarTheme.titleTextStyle?.fontSize ?? 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: actions,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: Theme.of(context).appBarTheme.elevation,
      iconTheme: Theme.of(context).appBarTheme.iconTheme,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

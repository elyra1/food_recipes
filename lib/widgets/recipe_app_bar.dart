import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_recepies/utils/app_colors.dart';

class RecipeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const RecipeAppBar({super.key, this.title: ''});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      centerTitle: true,
      title: AutoSizeText(title,
          style: const TextStyle(fontSize: 21, color: AppColors.white)),
      backgroundColor: AppColors.darkRed,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

import 'package:flutter/material.dart';
import 'package:food_recepies/utils/app_colors.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  TopAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      centerTitle: true,
      title: Text(title,
          style: TextStyle(fontSize: 21, color: AppColors.white)),
      backgroundColor: AppColors.darkRed,
      actions: [
        Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: AppColors.white,
                  size: 25,
                )))
      ],
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

}
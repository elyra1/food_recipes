
import 'package:flutter/material.dart';
import 'package:food_recepies/utils/app_colors.dart';

class ShowAllButton extends StatelessWidget {
  final Function()? onPressed;
  const ShowAllButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 280,
      width: 160,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(4, 6))
      ]),
      child: ElevatedButton(
        child: Column(
          children: [
            Icon(Icons.arrow_forward_ios, size: 60),
            Text(
              'Показать всё',style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.black.withAlpha(1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero),
            padding: EdgeInsets.symmetric(vertical: 100)),
      ),
    );
  }
}
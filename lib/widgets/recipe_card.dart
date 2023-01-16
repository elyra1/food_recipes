import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_recepies/screens/recipe_screen.dart';
import 'package:food_recepies/utils/app_colors.dart';
import 'package:food_recepies/utils/tools.dart';

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String recipeUrl;
  final noUrlImage = Tools.noUrlImage;
  RecipeCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.recipeUrl,
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
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.beige,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            padding: EdgeInsets.zero),
        child: Column(
          children: [
            Container(
                width: 160,
                height: 155,
                child: (imageUrl.contains('http'))
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        noUrlImage,
                        fit: BoxFit.cover,
                      )),
            Container(
              width: 160,
              height: 125,
              padding: EdgeInsets.symmetric(horizontal: 7, vertical: 15),
              child: Center(
                  child: AutoSizeText(
                minFontSize: 16,
                title,
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              )),
            )
          ],
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeScreen(recipeUrl: recipeUrl))),
      ),
    );
  }
}

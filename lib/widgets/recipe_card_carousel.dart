import 'package:flutter/material.dart';
import 'package:food_recepies/utils/tools.dart';
import 'package:food_recepies/widgets/recipe_card.dart';
import 'package:food_recepies/widgets/show_all_button.dart';

class RecipeCardCarousel extends StatelessWidget {
  final String title;
  final List imageUrls;
  final List dishNames;
  final List recipeUrls;
  RecipeCardCarousel(
      {Key? key,
      required this.title,
      required this.dishNames,
      required this.imageUrls,
      required this.recipeUrls})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(top: 10, left: 6),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Tools.categoriesTextStyle,
              //style: TextStyle(fontSize: 21),
            )),
        Container(
          height: 300,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  for (var i = 0; i <= 3; i++)
                    RecipeCard(imageUrl: imageUrls[i], title: dishNames[i], recipeUrl: recipeUrls[i],),
                  ShowAllButton(onPressed: () {})
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

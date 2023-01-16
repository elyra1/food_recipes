import 'package:flutter/material.dart';
import 'package:food_recepies/models/recipe.dart';
import 'package:food_recepies/utils/tools.dart';

class ShowRecipe extends StatelessWidget {
  const ShowRecipe({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  Widget build(BuildContext context) {
    return Column(
      children: [
        if (recipe.description != '')
          Text(recipe.description, style: Tools.recipeTextStyle),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            child: Text('Ингредиенты', style: Tools.headlineTextStyle)),
        if (recipe.ingredients != '')
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  for (int i = 0; i < recipe.ingredients.length; i++)
                    SizedBox(
                        height: 25,
                        width: 200,
                        child: Text(
                          recipe.ingredients[i],
                          textAlign: TextAlign.left,
                          style: Tools.recipeTextStyle,
                        )),
                ],
              ),
              Column(
                children: [
                  for (int i = 0; i < recipe.ingredients.length; i++)
                    Container(
                        height: 25,
                        width: 150,
                        alignment: Alignment.centerRight,
                        child: Text(
                          recipe.ingredientsNumber[i],
                          textAlign: TextAlign.right,
                          style: Tools.recipeTextStyle,
                        )),
                ],
              ),
            ],
          ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            child: Text('Инструкция приготовления',
                style: Tools.headlineTextStyle)),
        Column(
          children: [
            for (int i = 0; i < recipe.instructions.length; i++)
              Column(
                children: [
                  SizedBox(
                      width: 400,
                      child: Text(
                        '${i + 1}. ${recipe.instructions[i]}',
                        style: Tools.recipeTextStyle,
                        textAlign: TextAlign.left,
                      )),
                  if (recipe.imageUrl.isEmpty != true)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 22),
                      child: Image.network(
                        recipe.imageUrl[i],
                      ),
                    )
                ],
              ),
          ],
        )
      ],
    );
  }
}

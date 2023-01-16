import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:food_recepies/models/recipe.dart';
import 'package:food_recepies/utils/app_colors.dart';
import 'package:food_recepies/utils/tools.dart';
import 'package:food_recepies/widgets/recipe_app_bar.dart';
import 'package:food_recepies/widgets/show_recipe.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

String checkString(String string) => string.replaceAll('&nbsp;', ' ');

class RecipeScreen extends StatefulWidget {
  static String routeName = '/recipe';
  final String recipeUrl;

  RecipeScreen({super.key, required this.recipeUrl});

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  String noUrlImage = Tools.noUrlImage;
  Recipe recipe = Recipe();

  @override
  void initState() {
    super.initState();
    String recipeUrl = widget.recipeUrl;
    getWebsiteData(recipeUrl);
  }

  Future getWebsiteData(String recipeUrl) async {
    final url = Uri.parse('http://eda.ru$recipeUrl');
    final response = await http.get(url);
    final html = dom.Document.html(response.body);
    String title =
        checkString(html.querySelector('span > h1')!.innerHtml.trim());
    String description =
        (html.querySelector('div.emotion-1ik2huf > span.emotion-1x1q7i2') ==
                null)
            ? ''
            : checkString(html
                .querySelector('div.emotion-1ik2huf > span.emotion-1x1q7i2')!
                .innerHtml
                .trim());
    List ingredients = html
        .querySelectorAll('div > div.emotion-bjn8wh > span > span')
        .map((e) => e.innerHtml.trim())
        .toList();
    List ingredientsNumber = html
        .querySelectorAll('div > span.emotion-15im4d2')
        .map((e) => e.innerHtml.trim())
        .toList();
    List imageUrl = html
        .querySelectorAll('div.emotion-4ck5vf picture > img')
        .map((e) => e.attributes['src'])
        .toList();
    List instructions = html
        .querySelectorAll('div > span.emotion-6kiu05 > span')
        .map((e) => checkString(e.innerHtml.trim()))
        .toList();

    if (mounted) {
      setState(() {
        recipe = Recipe(
            title: title,
            description: description,
            imageUrl: imageUrl,
            ingredients: ingredients,
            ingredientsNumber: ingredientsNumber,
            instructions: instructions);
      });
    }
  }

  bool dataStatus(Recipe recipe) => (recipe.title.isEmpty &
      recipe.description.isEmpty &
      recipe.imageUrl.isEmpty &
      recipe.ingredients.isEmpty &
      recipe.ingredientsNumber.isEmpty &
      recipe.instructions.isEmpty);

  @override
  Widget build(BuildContext context) {
    String recipeUrl = widget.recipeUrl;
    if (dataStatus(recipe)) getWebsiteData(recipeUrl);
    return (recipe.title.isEmpty)
        ? const Scaffold(
            appBar: RecipeAppBar(),
            body: Center(
                child: CircularProgressIndicator(color: AppColors.darkRed)),
          )
        : Scaffold(
            backgroundColor: AppColors.white,
            appBar: RecipeAppBar(
              title: recipe.title,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                color: AppColors.white,
                child: ShowRecipe(recipe: recipe),
              ),
            ),
          );
  }
}




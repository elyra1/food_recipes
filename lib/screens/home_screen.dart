import 'package:flutter/material.dart';
import 'package:food_recepies/models/article_recipe.dart';
import 'package:food_recepies/utils/app_colors.dart';
import 'package:food_recepies/utils/tools.dart';
import 'package:food_recepies/widgets/app_drawer.dart';
import 'package:food_recepies/widgets/recipe_card_carousel.dart';
import 'package:food_recepies/widgets/home_app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

String checkTitle(String title) {
  if (title.contains('<')) {
    title = title.substring(0, title.indexOf('<'));
  }
  return title;
}

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List sites = Tools.sites;
  List categoryName = Tools.categoryName;
  static List categories = Tools.categories;

  List urls = List.generate(categories.length, (index) => 0);
  List<dynamic> response = List.generate(categories.length, (index) => 0);
  List htmls = List.generate(categories.length, (index) => 0);
  List<List> titles = List.generate(categories.length, (index) => []);
  List<List> urlImages = List.generate(categories.length, (index) => []);
  List<List> recipesUrl = List.generate(categories.length, (index) => []);

  Future getWebsiteData() async {
    for (int i = 0; i < 7; i++) {
      urls[i] = Uri.parse(sites[i]);
      response[i] = await http.get(urls[i]);
      htmls[i] = dom.Document.html(response[i].body);

      titles[i] = htmls[i]
          .querySelectorAll('div.emotion-1eugp2w > a > span')
          .map((element) => checkTitle(element.innerHtml.trim()))
          .toList();

      urlImages[i] = htmls[i]
          .querySelectorAll('a > div > picture > img')
          .map((element) => element.attributes['src']!)
          .toList();
      recipesUrl[i] = htmls[i]
          .querySelectorAll('div.emotion-1eugp2w > a')
          .map((element) => element.attributes['href']!)
          .toList();
    }
    if (mounted) {
      setState(() {
        for (int i = 0; i < categories.length; i++) {
          categories[i] = List.generate(
              categories.length,
              (index) => ArticleRecipe(
                  title: titles[i][index],
                  urlImage: urlImages[i][index],
                  recipeUrl: recipesUrl[i][index]));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (categories.any((element) => element.length == 0)) getWebsiteData();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: TopAppBar(title: 'Рецепты'),
      drawer: AppDrawer(),
      body: (categories.every((element) => element.length == 0))
          ? Center(child: CircularProgressIndicator(color: AppColors.darkRed))
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: ListView.builder(
                  itemCount: titles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RecipeCardCarousel(
                      title: categoryName[index],
                      
                      dishNames: [
                        categories[index][0].title,
                        categories[index][1].title,
                        categories[index][2].title,
                        categories[index][3].title
                      ],
                      imageUrls: [
                        categories[index][0].urlImage,
                        categories[index][1].urlImage,
                        categories[index][2].urlImage,
                        categories[index][3].urlImage
                      ],
                      recipeUrls: [
                        categories[index][0].recipeUrl,
                        categories[index][1].recipeUrl,
                        categories[index][2].recipeUrl,
                        categories[index][3].recipeUrl
                      ],
                    );
                  }),
            ),
    );
  }
}

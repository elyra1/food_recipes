import 'package:flutter/material.dart';
import 'package:food_recepies/models/article_recipe.dart';
import 'package:food_recepies/utils/app_colors.dart';

abstract class Tools {
  static TextStyle recipeTextStyle =  const TextStyle(color: AppColors.black,fontSize: 18); 
  static TextStyle headlineTextStyle =  const TextStyle(color: AppColors.darkRed, fontSize: 19, fontWeight: FontWeight.bold);
  static TextStyle categoriesTextStyle = const TextStyle(color: AppColors.darkRed, fontSize: 24, fontWeight: FontWeight.bold);  
  static const List sites = [
    'https://eda.ru/recepty/zavtraki',
    'https://eda.ru/recepty/supy',
    'https://eda.ru/recepty/osnovnye-blyuda',
    'https://eda.ru/recepty/salaty',
    'https://eda.ru/recepty/vypechka-deserty',
    'https://eda.ru/recepty/napitki',
    'https://eda.ru/recepty/zakuski'
  ];

  static const List categoryName = [
    'Завтраки',
    'Супы',
    'Основные блюда',
    'Салаты',
    'Выпечка и десерты',
    'Напитки',
    'Закуски'
  ];

  static List<ArticleRecipe> breakfasts = [];
  static List<ArticleRecipe> soups = [];
  static List<ArticleRecipe> mainDishes = [];
  static List<ArticleRecipe> salads = [];
  static List<ArticleRecipe> bakeryAndDesserts = [];
  static List<ArticleRecipe> drinks = [];
  static List<ArticleRecipe> snacks = [];

  static List categories = [
    breakfasts,
    soups,
    mainDishes,
    salads,
    bakeryAndDesserts,
    drinks,
    snacks
  ];
  static String noUrlImage =
      'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQCHGT6SjpedfFJiiGPLq5uFzHf__55sczyB7Muat-3a8v4n7mb';
}

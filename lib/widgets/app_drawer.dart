import 'package:flutter/material.dart';
import 'package:food_recepies/utils/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      child: ListView(
        children: [
          Text('Категории'),
          TextButton(
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  child: Text('Завтраки'))),
          TextButton(
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  child: Text('Супы'))),
          TextButton(
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  child: Text('Основные блюда'))),
          TextButton(
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  child: Text('Салаты'))),
          TextButton(
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  child: Text('Выпечка и десерты'))),
          TextButton(
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  child: Text('Напитки'))),
          TextButton(
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  child: Text('Закуски'))),
        ],
      ),
    );
  }
}

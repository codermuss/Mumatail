import 'package:flutter/material.dart';
import 'package:mumacock/screens/cocktail_recipe_page/cocktail_recipe_view.dart';

import 'utils/helpers/locator_helper.dart';

void main() {
  initializeLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const CocktailRecipeView(),
    );
  }
}

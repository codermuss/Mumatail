import 'package:flutter/material.dart';
import 'package:mumacock/screens/cocktail_recipe_page/cocktail_recipe_viewmodel.dart';
import 'package:mumacock/utils/widgets/skeletons/view_model_skeleton.dart';

import '../../utils/helpers/locator_helper.dart';

class CocktailRecipeView extends StatefulWidget {
  const CocktailRecipeView({Key? key}) : super(key: key);

  @override
  State<CocktailRecipeView> createState() => _CocktailRecipeViewState();
}

class _CocktailRecipeViewState extends State<CocktailRecipeView> {
  final CocktailRecipeViewModel _viewModel = getIt<CocktailRecipeViewModel>();
  @override
  Widget build(BuildContext context) {
    return ViewModelSkeleton<CocktailRecipeViewModel>(
      builder: (viewModel) => _buildPage(),
      viewModel: _viewModel,
    );
  }

  _buildPage() {
    return ListView.builder(
        itemCount: _viewModel.cocktailRecipeData?.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                  _viewModel.cocktailRecipeData?[index].idDrink.toString() ??
                      ""),
              subtitle: Text(
                  _viewModel.cocktailRecipeData?[index].strInstructions ?? ""),
            ),
          );
        });
  }
}

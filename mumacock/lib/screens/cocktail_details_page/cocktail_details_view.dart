import 'package:flutter/material.dart';

import '../../utils/constants/double_constants.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/helpers/locator_helper.dart';
import '../../utils/styles/custom_color_styles.dart';
import '../../utils/styles/custom_text_styles.dart';
import '../cocktail_recipe_page/cocktail_recipe_viewmodel.dart';

// ignore: must_be_immutable
class CocktailDetailsView extends StatelessWidget {
  CocktailDetailsView({Key? key, this.index}) : super(key: key);
  CocktailRecipeViewModel? viewModel = getIt<CocktailRecipeViewModel>();
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: getIt<CustomColorStyles>().c8b6ff,
        title: Text(getIt<StringConstants>().appName,
            style: getIt<CustomTextStyles>().boldWhiteTextStyle),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: (Radius.circular(getIt<DoubleConstants>().radius)),
            bottomLeft: Radius.circular(getIt<DoubleConstants>().radius),
          ),
        ),
      ),
      body: Center(
        child:
            Text("${viewModel?.cocktailRecipeData?[index!].strInstructions}"),
      ),
    );
  }
}

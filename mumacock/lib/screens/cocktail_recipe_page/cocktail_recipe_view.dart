import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mumacock/screens/cocktail_recipe_page/cocktail_recipe_viewmodel.dart';
import 'package:mumacock/utils/constants/route_constants.dart';
import 'package:mumacock/utils/constants/string_constants.dart';
import 'package:mumacock/utils/widgets/skeletons/view_model_skeleton.dart';

import '../../utils/helpers/locator_helper.dart';
import '../../utils/widgets/custom_widgets/card_widget.dart';

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
    const double _borderRadius = 24.0;
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: ListView.builder(
                itemCount: _viewModel.cocktailRecipeData?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Stack(children: <Widget>[
                      CardCockTailContainer(
                          category: _viewModel
                                  .cocktailRecipeData?[index].strCategory ??
                              "Other",
                          imageURL: _viewModel
                                  .cocktailRecipeData?[index].strDrinkThumb ??
                              getIt<StringConstants>().defaultURL,
                          title:
                              _viewModel.cocktailRecipeData?[index].strDrink ??
                                  "Error",
                          borderRadius: _borderRadius,
                          colors: [HexColor("#ffd6ff"), HexColor("#e7c6ff")]),
                      const CardCockTailPosition(borderRadius: _borderRadius),
                      Positioned(
                          bottom: 10,
                          left: 20,
                          child: Row(
                            children: <Widget>[
                              ElevatedButton(
                                  onPressed: () {
                                    _cocktailDetailsGet(context, index);
                                  },
                                  child: const Text("İncele"),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              HexColor("#bbd0ff")),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side: BorderSide(
                                              color: HexColor("#bbd0ff")),
                                        ),
                                      )))
                            ],
                          ))
                    ])),
                  );
                }),
          ),
        )
      ],
    );
  }
}

_cocktailDetailsGet(BuildContext context, int index) {
  print(index);
  Navigator.of(context)
      .pushNamed(RouteConstants.cocktailDetails, arguments: index);
}

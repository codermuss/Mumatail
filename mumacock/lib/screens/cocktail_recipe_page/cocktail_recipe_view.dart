import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mumacock/screens/cocktail_recipe_page/cocktail_recipe_viewmodel.dart';
import 'package:mumacock/utils/constants/double_constants.dart';
import 'package:mumacock/utils/constants/string_constants.dart';
import 'package:mumacock/utils/styles/custom_color_styles.dart';
import 'package:mumacock/utils/widgets/skeletons/view_model_skeleton.dart';

import '../../utils/helpers/bottom_navbar_class.dart';
import '../../utils/helpers/locator_helper.dart';
import '../../utils/styles/custom_text_styles.dart';
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
    return Scaffold(
        body: Column(
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
                              imageURL: _viewModel.cocktailRecipeData?[index]
                                      .strDrinkThumb ??
                                  getIt<StringConstants>().defaultURL,
                              title: _viewModel
                                      .cocktailRecipeData?[index].strDrink ??
                                  "Error",
                              borderRadius: _borderRadius,
                              colors: [
                                HexColor("#ffd6ff"),
                                HexColor("#e7c6ff")
                              ]),
                          const CardCockTailPosition(
                              borderRadius: _borderRadius),
                          Positioned(
                              bottom: 10,
                              left: 20,
                              child: Row(
                                children: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {
                                        _cocktailDetailsGet(context);
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
        ),
        bottomNavigationBar: _bottomNavBar(context),
        appBar: AppBar(
          leading: const Icon(Icons.home),
          elevation: 10,
          backgroundColor: getIt<CustomColorStyles>().c8b6ff,
          title: Text(getIt<StringConstants>().appName,
              style: getIt<CustomTextStyles>().boldWhiteTextStyle),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: (Radius.circular(getIt<DoubleConstants>().radius)),
            bottomLeft: Radius.circular(getIt<DoubleConstants>().radius),
          )),
        ));
  }
}

_bottomNavBar(context) {
  return SizedBox(
    height: 95,
    child: Stack(
      children: <Widget>[
        Positioned(
            bottom: 0.0,
            child: ClipPath(
                clipper: NavbarCustomClip(),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    getIt<CustomColorStyles>().c8b6ff,
                    getIt<CustomColorStyles>().b8c0ff
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                ))),
        Positioned(
            bottom: 45,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildNavItem(Icons.local_drink, true),
                const SizedBox(width: 1),
                _buildNavItem(Icons.local_drink, false),
                const SizedBox(width: 1),
                _buildNavItem(Icons.favorite, false),
              ],
            )),
        Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 35),
                Text("Kokteyl Tarifi",
                    style: getIt<CustomTextStyles>().boldWhiteTextStyle),
                const SizedBox(width: 60),
                Text("Kokteyl Mix",
                    style: getIt<CustomTextStyles>().boldWhiteTextStyle),
                const SizedBox(width: 50),
                Text("Favorilerim",
                    style: getIt<CustomTextStyles>().boldWhiteTextStyle),
              ],
            ))
      ],
    ),
  );
}

_buildNavItem(IconData icon, bool active) {
  return ElevatedButton(
    style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: getIt<CustomColorStyles>().bbd0ff))),
        backgroundColor: active
            ? MaterialStateProperty.all<Color>(Colors.white)
            : MaterialStateProperty.all<Color>(
                getIt<CustomColorStyles>().bbd0ff)),
    onPressed: () {},
    child: CircleAvatar(
      radius: 25,
      backgroundColor:
          active ? Colors.white.withOpacity(0.9) : Colors.transparent,
      child: Icon(icon,
          color: active ? Colors.black : Colors.white.withOpacity(0.9)),
    ),
  );
}

_cocktailMakerGet(BuildContext context) {
  Navigator.of(context).pushNamed("/ShoppingList");
}

_cocktailDetailsGet(BuildContext context) {
  Navigator.of(context).pushNamed("/CockTailDetails");
}

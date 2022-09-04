import 'package:flutter/material.dart';
import 'package:mumacock/screens/cocktail_details_page/cocktail_details_view.dart';
import 'package:mumacock/screens/cocktail_maker_page/cocktail_maker_view.dart';
import 'package:mumacock/screens/home_page/home_page_view.dart';

import '../../screens/favorites_page/favorites_view.dart';
import '../constants/route_constants.dart';

class RouterHelper {
  Route<MaterialPageRoute> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case RouteConstants.initialPage:
        return _generateRoute(const HomePage(), RouteConstants.initialPage);

      case RouteConstants.cocktailDetails:
        final args = settings.arguments as int;
        return _generateRoute(
            CocktailDetailsView(index: args), RouteConstants.cocktailDetails);

      case RouteConstants.coctailMaker:
        return _generateRoute(
            const CocktailMakerView(), RouteConstants.coctailMaker);

      case RouteConstants.favorites:
        return _generateRoute(const Favorites(), RouteConstants.favorites);

      default:
        return _generateRoute(
            const CircularProgressIndicator(), RouteConstants.errorPage);
    }
  }

  Route<MaterialPageRoute> _generateRoute(
    Widget page,
    String routeName,
  ) {
    return MaterialPageRoute(
        builder: (context) => page, settings: RouteSettings(name: routeName));
  }
}

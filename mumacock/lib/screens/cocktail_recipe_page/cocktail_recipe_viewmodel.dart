import 'package:mumacock/core/models/cocktail_recipe_model/cocktail_recipe_model.dart';
import 'package:mumacock/core/services/cocktail_recipe_service.dart';
import 'package:mumacock/utils/helpers/base_view_model.dart';

import '../../utils/constants/enums.dart';
import '../../utils/helpers/locator_helper.dart';

class CocktailRecipeViewModel extends BaseViewModel {
  List<CocktailRecipeModel>? _cocktailRecipeData;
  List<CocktailRecipeModel>? get cocktailRecipeData => _cocktailRecipeData;

  final CocktailRecipeService _cocktailRecipeService =
      getIt<CocktailRecipeService>();
  @override
  Future<void> initProvider() async {
    Future.microtask(() => providerState = ProviderState.busy);
    await _getCocktailRecipeInfo();
    providerState = ProviderState.idle;
  }

  _getCocktailRecipeInfo() async {
    final List<CocktailRecipeModel> _response =
        await _cocktailRecipeService.getCocktailRecipeInfo();
    _cocktailRecipeData = _response;
  }
}

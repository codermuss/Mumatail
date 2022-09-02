import 'package:mumacock/core/models/cocktail_recipe_model/cocktail_recipe_model.dart';
import 'package:mumacock/utils/helpers/base_api_service.dart';

class CocktailRecipeService extends BaseApiService {
  Future<List<CocktailRecipeModel>> getCocktailRecipeInfo() async {
    return await networkService.fetchData(
        "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a",
        CocktailRecipeModel());
  }
}

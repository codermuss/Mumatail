import 'package:get_it/get_it.dart';
import 'package:mumacock/core/services/cocktail_recipe_service.dart';
import 'package:mumacock/utils/constants/double_constants.dart';
import 'package:mumacock/utils/constants/string_constants.dart';
import 'package:mumacock/utils/helpers/router_helper.dart';
import 'package:mumacock/utils/styles/custom_color_styles.dart';
import 'package:mumacock/utils/styles/custom_text_styles.dart';

import '../../core/services/network_service.dart';
import '../../screens/cocktail_recipe_page/cocktail_recipe_viewmodel.dart';

final GetIt _getIt = GetIt.instance;
GetIt get getIt => _getIt;

//locator olmasının sebebi yer tutucu anlamında. Nesneleri bir kere yaratıp yerini tutuyor.
void initializeLocator() {
  //Service Instances
  getIt.registerLazySingleton(() => NetworkService());

  //ViewModel Instances
  getIt.registerLazySingleton(() => CocktailRecipeViewModel());

  //Service Instances
  getIt.registerLazySingleton(() => CocktailRecipeService());

  //Constants Instances
  getIt.registerLazySingleton(() => StringConstants());
  getIt.registerLazySingleton(() => DoubleConstants());
  getIt.registerLazySingleton(() => CustomTextStyles());
  getIt.registerLazySingleton(() => CustomColorStyles(1));

  //Helper Instances
  getIt.registerLazySingleton(() => RouterHelper());
}

//done

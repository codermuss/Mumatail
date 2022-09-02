// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final cocktailRecipeModel = cocktailRecipeModelFromJson(jsonString);

import 'package:mumacock/utils/helpers/base_model.dart';

class CocktailRecipeModel extends BaseModel {
  String? idDrink;
  String? strDrink;
  String? strTags;
  String? strVideo;
  String? strCategory;
  String? strIBA;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  String? strInstructionsES;
  String? strInstructionsDE;
  String? strInstructionsIT;
  String? strDrinkThumb;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strImageSource;
  String? strImageAttribution;
  String? strCreativeCommonsConfirmed;
  String? dateModified;
  CocktailRecipeModel({
    this.idDrink,
    this.strDrink,
    this.strTags,
    this.strVideo,
    this.strCategory,
    this.strIBA,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strInstructionsES,
    this.strInstructionsDE,
    this.strInstructionsIT,
    this.strDrinkThumb,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strImageSource,
    this.strImageAttribution,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  @override
  modelFromJson(Map<String, dynamic> data) {
    final cdata = data['drinks'] as List<dynamic>?;
    final List<CocktailRecipeModel> coctails = cdata != null
        ? cdata
            .map((reviewdata) => CocktailRecipeModel().fromJson(reviewdata))
            .toList()
        : <CocktailRecipeModel>[];
    return coctails;
  }

  CocktailRecipeModel fromJson(Map<String, dynamic> data) {
    final idDrink = data['idDrink'];
    final strInstructions = data['strInstructions'];
    return CocktailRecipeModel(
        idDrink: idDrink, strInstructions: strInstructions);
  }
}

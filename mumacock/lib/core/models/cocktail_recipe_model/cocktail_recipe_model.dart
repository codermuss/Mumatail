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

    final strDrink = data['strDrink'];
    final strTags = data['strTags'];
    final strVideo = data['strVideo'];
    final strCategory = data['strCategory'];
    final strIBA = data['strIBA'];
    final strAlcoholic = data['strAlcoholic'];
    final strGlass = data['strGlass'];
    final strInstructions = data['strInstructions'];
    final strInstructionsES = data['strInstructionsES'];
    final strInstructionsDE = data['strInstructionsDE'];
    final strInstructionsIT = data['strInstructionsIT'];
    final strDrinkThumb = data['strDrinkThumb'];
    final strIngredient1 = data['strIngredient1'];
    final strIngredient2 = data['strIngredient2'];
    final strIngredient3 = data['strIngredient3'];
    final strIngredient4 = data['strIngredient4'];
    final strIngredient5 = data['strIngredient5'];
    final strIngredient6 = data['strIngredient6'];
    final strMeasure1 = data['strMeasure1'];
    final strMeasure2 = data['strMeasure2'];
    final strMeasure3 = data['strMeasure3'];
    final strMeasure4 = data['strMeasure4'];
    final strMeasure5 = data['strMeasure5'];
    final strMeasure6 = data['strMeasure6'];
    final strImageSource = data['strImageSource'];
    final strImageAttribution = data['strImageAttribution'];
    final strCreativeCommonsConfirmed = data['strCreativeCommonsConfirmed'];
    final dateModified = data['dateModified'];

    return CocktailRecipeModel(
        idDrink: idDrink,
        strDrink: strDrink,
        strTags: strTags,
        strVideo: strVideo,
        strCategory: strCategory,
        strIBA: strIBA,
        strAlcoholic: strAlcoholic,
        strGlass: strGlass,
        strInstructions: strInstructions,
        strInstructionsES: strInstructionsES,
        strInstructionsDE: strInstructionsDE,
        strInstructionsIT: strInstructionsIT,
        strDrinkThumb: strDrinkThumb,
        strIngredient1: strIngredient1,
        strIngredient2: strIngredient2,
        strIngredient3: strIngredient3,
        strIngredient4: strIngredient4,
        strIngredient5: strIngredient5,
        strIngredient6: strIngredient6,
        strMeasure1: strMeasure1,
        strMeasure2: strMeasure2,
        strMeasure3: strMeasure3,
        strMeasure4: strMeasure4,
        strMeasure5: strMeasure5,
        strMeasure6: strMeasure6,
        strImageSource: strImageSource,
        strImageAttribution: strImageAttribution,
        strCreativeCommonsConfirmed: strCreativeCommonsConfirmed,
        dateModified: dateModified);
  }
}

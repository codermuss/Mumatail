import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CocktailMakerView extends StatefulWidget {
  const CocktailMakerView({Key? key}) : super(key: key);

  @override
  State<CocktailMakerView> createState() => _CocktailMakerViewState();
}

class _CocktailMakerViewState extends State<CocktailMakerView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Maker View"),
    );
  }
}

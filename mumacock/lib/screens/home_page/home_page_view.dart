import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mumacock/screens/cocktail_maker_page/cocktail_maker_view.dart';
import 'package:mumacock/screens/cocktail_recipe_page/cocktail_recipe_view.dart';
import 'package:mumacock/screens/favorites_page/favorites_view.dart';

import '../../utils/constants/double_constants.dart';
import '../../utils/constants/string_constants.dart';
import '../../utils/helpers/bottom_navbar_class.dart';
import '../../utils/helpers/locator_helper.dart';
import '../../utils/styles/custom_color_styles.dart';
import '../../utils/styles/custom_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
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
                ),
              ),
            ),
            BottomNavigationBar(
                currentIndex: pageIndex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                selectedItemColor: Colors.deepPurple,
                unselectedItemColor: Colors.deepPurple[300],
                onTap: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutSine);
                },
                elevation: 0,
                items: const [
                  BottomNavigationBarItem(
                    label: "Tarifler",
                    icon: Icon(FontAwesomeIcons.martiniGlassCitrus),
                  ),
                  BottomNavigationBarItem(
                    label: "Kendin Yap",
                    icon: Icon(FontAwesomeIcons.blender),
                  ),
                  BottomNavigationBarItem(
                    label: "Favoriler",
                    icon: Icon(
                      FontAwesomeIcons.solidHeart,
                    ),
                  ),
                ]),
          ],
        ),
      ),
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
          ),
        ),
      ),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        controller: pageController,
        children: const [
          CocktailRecipeView(),
          CocktailMakerView(),
          Favorites(),
        ],
      ),
    );
  }
}

_buildNavItem(IconData icon, bool active, String route, BuildContext context) {
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

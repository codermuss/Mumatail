import 'package:flutter/material.dart';

import 'utils/helpers/locator_helper.dart';
import 'utils/helpers/router_helper.dart';

void main() {
  initializeLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: getIt<RouterHelper>().generateRoute,
    );
  }
}

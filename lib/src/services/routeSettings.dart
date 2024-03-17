import 'package:flutter/material.dart';
import '../views/authScreens/SignInScreen.dart';
import '../views/authScreens/SignUpScreen.dart';
import '../views/fillingScreen/FillingScreen.dart';
import '../views/homeScreen/HomeScreen.dart';
import '../views/templateScreen/TemplateScreen.dart';

MaterialPageRoute? routeSettings(RouteSettings settings) {
  if (settings.name == HomeScreen.routeName) {
    return MaterialPageRoute(builder: (context) => HomeScreen());
  } else if (settings.name == FillingScreen.routeName) {
    return MaterialPageRoute(builder: (context) => FillingScreen());
  } else if (settings.name == TemplateScreen.routeName) {
    return MaterialPageRoute(builder: (context) => TemplateScreen());
  } else if (settings.name == SignUpScreen.routeName) {
    return MaterialPageRoute(builder: (context) => SignUpScreen());
  } else if (settings.name == SignInScreen.routeName) {
    return MaterialPageRoute(builder: (context) => SignInScreen());
  }
  return null;
}

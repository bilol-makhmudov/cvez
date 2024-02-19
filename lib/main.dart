import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:cv_ez/src/views/fillingScreen/FillingScreen.dart';
import 'package:cv_ez/src/views/homeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';

import 'src/views/SplashScreen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<FillingScreenBloc>(
      create: (context) => FillingScreenBloc(),
    ),
    BlocProvider<PersonalInfoBloc>(
      create: (context) => PersonalInfoBloc(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name == HomeScreen.routeName) {
            return MaterialPageRoute(builder: (context) => HomeScreen());
          } else if (settings.name == FillingScreen.routeName) {
            return MaterialPageRoute(builder: (context) => FillingScreen());
          }
          return null;
        },
        home: HomeScreen());
  }
}

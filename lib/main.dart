import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:cv_ez/src/views/fillingScreen/FillingScreen.dart';
import 'package:cv_ez/src/views/homeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<FillingScreenBloc>(
      create: (context) => FillingScreenBloc(),
    ),
    BlocProvider<PersonalInfoBloc>(
      create: (context) => PersonalInfoBloc(),
    ),
    BlocProvider<ExperienceBloc>(
      create: (context) => ExperienceBloc(),
    ),
    BlocProvider<EducationBloc>(
      create: (context) => EducationBloc(),
    ),
    BlocProvider<SkillBloc>(create: (context) => SkillBloc())
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
        supportedLocales: const [
          Locale('en', ''),
          Locale('uz', ''),
          Locale('tr', ''),
        ],
        localizationsDelegates: [
          MonthYearPickerLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        home: HomeScreen());
  }
}

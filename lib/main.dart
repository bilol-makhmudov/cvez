import 'package:cv_ez/src/blocs/AuthenticationBloc/authentication_bloc.dart';
import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:cv_ez/src/services/routeSettings.dart';
import 'package:cv_ez/src/views/AuthScreens/AuthenticationFlowScreen.dart';
import 'package:cv_ez/src/views/fillingScreen/FillingScreen.dart';
import 'package:cv_ez/src/views/homeScreen/HomeScreen.dart';
import 'package:cv_ez/src/views/templateScreen/TemplateScreen.dart';
import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthenticationBloc>(create: (context) => AuthenticationBloc()),
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
    BlocProvider<SkillBloc>(create: (context) => SkillBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings settings) => routeSettings(settings),
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
        home: AuthenticationFlowScreen());
  }
}

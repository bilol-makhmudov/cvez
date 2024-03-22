import 'package:cv_ez/src/plugin_test.dart';
import 'package:cv_ez/src/views/contactScreen/ContactScreen.dart';
import 'package:cv_ez/src/views/homeScreen/comingSoonTemplate/ComingSoonTemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/AuthenticationBloc/authentication_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routeName = "/homeScreen";

  ScrollController templateScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.blue,
          title: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "CV-ez",
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: "Outfit"),
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (click) {
                handleAppbarClick(click, context);
              },
              itemBuilder: (BuildContext context) {
                return {'Contact', 'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  "My CVs",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 150,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "In the coming updates you'll be able to see created CVs here",
                        style: TextStyle(color: Colors.green),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            const Text(
              "Create CV",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: Text(
                "Please, click here to create CV.",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 14,
                    fontFamily: "Outfit",
                    fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/arrow.png",
                    width: 100,
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_circle_outlined,
                        size: 50,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        // Navigator.pushNamed(context, '/templateScreen');
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Demo()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void handleAppbarClick(String value, BuildContext context) {
  switch (value) {
    case 'Logout':
      BlocProvider.of<AuthenticationBloc>(context).add(SignOut());
      break;
    case 'Contact':
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ContactScreen(),
        ),
      );
      break;
  }
}

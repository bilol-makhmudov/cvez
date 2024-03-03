import 'package:cv_ez/src/views/contactScreen/ContactScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routeName = "/homeScreen";

  ScrollController templateScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ContactScreen(),
                  ),
                );
              },
              itemBuilder: (BuildContext context) {
                return {
                  'Contact',
                }.map((String choice) {
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
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Popular templates",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Outfit",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Scrollbar(
              controller: templateScrollController,
              thumbVisibility: true,
              trackVisibility: true,
              child: SingleChildScrollView(
                controller: templateScrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: Container(
                          height: 200,
                          width: 150,
                          child: Stack(
                            children: [
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black12, BlendMode.darken),
                                child: Image.asset(
                                  "assets/template1.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 50,
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: Container(
                          height: 200,
                          width: 150,
                          child: Stack(
                            children: [
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black12, BlendMode.darken),
                                child: Image.asset(
                                  "assets/template2.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Coming soon",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 18),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: Container(
                          height: 200,
                          width: 150,
                          child: Stack(
                            children: [
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.black12, BlendMode.darken),
                                child: Image.asset(
                                  "assets/template3.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Coming soon",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 18),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: Container(
                          height: 200,
                          width: 150,
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                          child: Stack(
                            children: [
                              ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.white, BlendMode.darken),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Coming soon",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 18),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(16.0),
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
                      padding: const EdgeInsets.all(8.0),
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
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "You haven't created any CV. \n Please, click here to create one.",
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
                      icon: Icon(
                        Icons.add_circle_outlined,
                        size: 50,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/fillingScreen');
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

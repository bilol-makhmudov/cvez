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
            IconButton(
              icon: const Icon(
                Icons.menu,
                size: 25,
              ),
              onPressed: () {},
            )
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
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1)),
                      ),
                    )
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

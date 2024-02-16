import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = "/splashScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: const Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CV-ez",
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: "Outfit"),
            ),
            Text("Build perfect CV easy",
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontFamily: "Outfit"))
          ],
        )),
      ),
    );
  }
}

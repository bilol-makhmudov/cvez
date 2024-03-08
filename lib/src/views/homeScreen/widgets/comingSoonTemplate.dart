import 'package:flutter/material.dart';

Widget ComingSoonTemplate(String? assetPath) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
    child: Container(
        height: 200,
        width: 150,
        decoration: assetPath == null
            ? BoxDecoration(border: Border.all(width: 1))
            : null,
        child: Stack(
          children: [
            if (assetPath != null)
              ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
                child: Image.asset(
                  assetPath,
                  fit: BoxFit.fill,
                ),
              ),
            if (assetPath == null)
              ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken),
              ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Coming soon",
                style: TextStyle(color: Colors.green, fontSize: 18),
              ),
            ),
          ],
        )),
  );
}

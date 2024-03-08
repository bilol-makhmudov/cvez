import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget SelectedTemplate(String? assetPath) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
    child: Container(
        height: 200,
        width: 150,
        child: Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
              child: Image.asset(
                assetPath!,
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
  );
}

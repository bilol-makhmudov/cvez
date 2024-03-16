import 'package:cv_ez/src/views/homeScreen/widgets/selectedTemplate.dart';
import 'package:flutter/material.dart';

class ComingSoonTemplates extends StatelessWidget {
  const ComingSoonTemplates({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> templates = [];
    templates.add(SelectedTemplate("assets/template1.jpg"));

    for (int i = 2; i <= 9; i++) {
      String assetPath = "assets/template$i.jpg";

      templates.add(
        GestureDetector(
          onTap: () {
            print(assetPath);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: SizedBox(
              height: 200,
              width: 150,
              child: Stack(
                children: [
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(Colors.black12, BlendMode.darken),
                    child: Image.asset(
                      assetPath,
                      width: 150,
                      height: 200,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Coming soon",
                      style: TextStyle(color: Colors.green, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),
      controller: ScrollController(),
      children: templates,
    );
  }
}

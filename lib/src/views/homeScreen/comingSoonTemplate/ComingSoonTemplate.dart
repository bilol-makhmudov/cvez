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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Container(
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: Stack(
              children: [
                ColorFiltered(
                  colorFilter: const ColorFilter.mode(Colors.black12, BlendMode.darken),
                  child: Image.asset(
                    assetPath,
                    fit: BoxFit.fill,
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
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: templates,
      ),
    );
  }
}

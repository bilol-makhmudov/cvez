import 'package:flutter/material.dart';
import 'package:cv_ez/src/models/Template.dart';

class TemplatesGridView extends StatelessWidget {
  final List<Template> templates;

  const TemplatesGridView({super.key, required this.templates});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: templates.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        final template = templates[index];
        return GestureDetector(
          onTap: () {
            // Şablona tıklandığında yapılacak işlemler
          },
          child: Stack(
            children: [
              ColorFiltered(
                colorFilter: const ColorFilter.mode(Colors.black12, BlendMode.darken),
                child: Image.network(
                  template.url,
                  fit: BoxFit.cover,
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
        );
      },
    );
  }
}

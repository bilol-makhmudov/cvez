import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cv_ez/src/models/Template.dart';
import '../../../blocs/TemplatesBloc/templates_bloc.dart';
import '../../../blocs/TemplatesBloc/templates_state.dart';

class TemplatesGridView extends StatefulWidget {
  final List<Template> templates;

  const TemplatesGridView({super.key, required this.templates});

  @override
  State<TemplatesGridView> createState() => _TemplatesGridViewState();
}

class _TemplatesGridViewState extends State<TemplatesGridView> {
  late Template selectedTemplate;

  @override
  void initState() {
    super.initState();
    selectedTemplate = widget.templates.first;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 30) / 2;

    return BlocBuilder<TemplatesBloc, TemplatesState>(
      builder: (context, state) {
        if (state is TemplatesSuccessState) {
          return GridView.builder(
            itemCount: state.templates.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemBuilder: (BuildContext context, int index) {
              final template = state.templates[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTemplate = template;
                  });
                },
                child: Stack(
                  children: [
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(Colors.black12, BlendMode.darken),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl: template.url,
                          fit: BoxFit.scaleDown,
                          width: itemWidth,
                          height: itemWidth,
                        ),
                      ),
                    ),
                    if (selectedTemplate != template)
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Coming soon",
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                      ),
                    if (selectedTemplate == template)
                      const Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 50,
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:cv_ez/src/views/homeScreen/comingSoonTemplate/ComingSoonTemplate.dart';

class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});
  static const String routeName = "/templateScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2.0,
        backgroundColor: Colors.blue,
        title: const Text("Templates", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: BlocConsumer<TemplatesBloc, TemplatesState>(
        listener: (context, state) {
          if (state is TemplatesFailureState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Error: ${state.errorMessage}'),
                );
              },
            );
          }
        },
        builder: (context, state) {
          if (state is TemplatesSuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: TemplatesGridView(templates: state.templates),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/fillingScreen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      "Create Resume",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

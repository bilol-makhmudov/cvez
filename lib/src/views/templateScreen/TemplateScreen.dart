import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/TemplatesBloc/templates_bloc.dart';
import '../../blocs/TemplatesBloc/templates_event.dart';
import '../../blocs/TemplatesBloc/templates_state.dart';
import '../../models/Template.dart';
import '../homeScreen/comingSoonTemplate/ComingSoonTemplate.dart';

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
      body: BlocProvider(
        create: (context) => TemplatesBloc()..add(const TakeTemplatesURL([])),
        child: BlocBuilder<TemplatesBloc, TemplatesState>(
          builder: (context, state) {
            print(state);
            return _buildUI(context, state);
          },
        ),
      ),
    );
  }

  Widget _buildUI(BuildContext context, TemplatesState state) {
    if (state is TemplatesIsLoading) {
      return _buildLoadingUI();
    } else if (state is TemplatesSuccessState) {
      return _buildSuccessUI(context, state.templates);
    } else if (state is TemplatesFailureState) {
      return _buildFailureUI(state.errorMessage);
    } else {
      return _buildLoadingUI();
    }
  }

  Widget _buildLoadingUI() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessUI(BuildContext context, List<Template> templates) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: TemplatesGridView(templates: templates),
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
  }

  Widget _buildFailureUI(String errorMessage) {
    return Center(
      child: Text('Error: $errorMessage'),
    );
  }
}

import 'dart:io';
import 'dart:typed_data';

import 'package:cv_ez/src/utils/fileSaver.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';

class Demo extends StatelessWidget {
  Demo({super.key});

  final ExportDelegate exportDelegate = ExportDelegate();

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: const Text('Flutter to PDF - Demo'),
          ),
          bottomSheet: Row(
            children: [
              TextButton(
                onPressed: () async {
                  final ExportOptions overrideOptions = ExportOptions(
                    textFieldOptions: TextFieldOptions.uniform(
                      interactive: false,
                    ),
                    checkboxOptions: CheckboxOptions.uniform(
                      interactive: false,
                    ),
                  );
                  final pdf = await exportDelegate.exportToPdfDocument('demo',
                      overrideOptions: overrideOptions);

                  final Uint8List bytes = await pdf.save();
                  saveSamplePdfFile(bytes, context);
                },
                child: const Row(
                  children: [
                    Text('Export as static'),
                    Icon(Icons.save_alt_outlined),
                  ],
                ),
              ),
              TextButton(
                onPressed: () async {
                  final pdf = await exportDelegate.exportToPdfDocument('demo');
                  final Uint8List bytes = await pdf.save();
                  saveSamplePdfFile(bytes, context);
                },
                child: const Row(
                  children: [
                    Text('Export as interactive'),
                    Icon(Icons.save_alt_outlined),
                  ],
                ),
              ),
            ],
          ),
          body: ExportFrame(
            frameId: 'demo',
            exportDelegate: exportDelegate,
            child: const SampleContainer(),
          ),
        ),
      );
}

class SampleContainer extends StatelessWidget {
  const SampleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text("This should be saved as PDF")],
    );
  }
}

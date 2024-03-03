import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';

import '../blocs/PersonalInfoBloc/personal_info_bloc.dart';
import '../widgets/snackBar.dart';

Future<void> savePdfFile(Uint8List pdfBytes, PersonalInfoBloc personalInfoBloc,
    BuildContext context) async {
  final tempDir = await getTemporaryDirectory();
  final tempPath = tempDir.path;

  final file = File(
      '$tempPath/${personalInfoBloc.personalInfo.firstName}_${personalInfoBloc.personalInfo.lastName}.pdf');
  await file.writeAsBytes(pdfBytes);

  final params = SaveFileDialogParams(sourceFilePath: file.path);
  final filePath = await FlutterFileDialog.saveFile(params: params);

  if (filePath != null && filePath.isNotEmpty) {
    final savedFile = File(filePath);
    await file.copy(savedFile.path);

    ScaffoldMessenger.of(context).showSnackBar(
        showCustomSnackBar("File has been saved here: ${filePath}"));
  }
}

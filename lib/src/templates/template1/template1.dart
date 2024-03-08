import 'dart:io';
import 'package:cv_ez/src/templates/template1/skills.dart';
import 'package:cv_ez/src/templates/template1/summary.dart';
import 'package:cv_ez/src/templates/template1/work.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../blocs/bloc_barrel.dart';
import '../../models/models.dart';
import '../../utils/NavigationToHome.dart';
import '../../utils/fileSaver.dart';
import '../../utils/pdfTextStyles.dart';
import 'education.dart';
import 'header.dart';

Future<void> generateTemplate1(
    PersonalInfoBloc personalInfoBloc,
    EducationBloc educationBloc,
    ExperienceBloc experienceBloc,
    SkillBloc skillBloc,
    BuildContext context) async {
  loadCustomFont();

  final pdf = pw.Document();
  pw.MemoryImage? pdfImage;

  final double contentWidth = PdfPageFormat.a4.width;
  final double contentHeight = PdfPageFormat.a4.height;

  if (personalInfoBloc.personalInfo.personalPhoto != null) {
    final Uint8List personalPhoto =
        await personalInfoBloc.personalInfo.personalPhoto!.readAsBytes();
    pdfImage = pw.MemoryImage(personalPhoto);
  }

  final educations = educationBloc.state is EducationLoadSuccess
      ? (educationBloc.state as EducationLoadSuccess).educations
      : <Education>[];

  final skills = skillBloc.state is SkillLoadSuccess
      ? (skillBloc.state as SkillLoadSuccess).skills
      : <Skill>[];

  final experiences = experienceBloc.state is ExperienceLoadSuccess
      ? (experienceBloc.state as ExperienceLoadSuccess).experiences
      : <Experience>[];

  final PdfColor darkColor = PdfColor.fromInt(0xff323b4c);

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return [
          header(
              headerWidth: contentWidth,
              personalInfoBloc: personalInfoBloc,
              headerBackgroundColor: PdfColor.fromInt(0xFFF5F3F5),
              contentPadding:
                  pw.EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              personalPhoto: pdfImage),
          summary(
            personalInfoBloc: personalInfoBloc,
            contentPadding:
                pw.EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          ),
          skillsPdf(
            skillsData: skills,
            personalInfoBloc: personalInfoBloc,
            contentPadding:
                pw.EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          ),
          educationPdf(
            educations: educations,
            personalInfoBloc: personalInfoBloc,
            contentPadding:
                pw.EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          ),
          workContainer(
            experiences: experiences,
            personalInfoBloc: personalInfoBloc,
            contentPadding:
                pw.EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          )
        ];
      },
    ),
  );

  final Uint8List bytes = await pdf.save();

  savePdfFile(bytes, personalInfoBloc, context, () {
    resetAndNavigateToHome(context);
  });
}

import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../blocs/bloc_barrel.dart';
import '../models/models.dart';

Future<String> generateCvPdf(
    PersonalInfoBloc personalInfoBloc,
    EducationBloc educationBloc,
    ExperienceBloc experienceBloc,
    SkillBloc skillBloc) async {
  final pdf = pw.Document();

  final double contentWidth = PdfPageFormat.a4.width;
  final double contentHeight = PdfPageFormat.a4.height;

  final Uint8List personalPhoto =
      await personalInfoBloc.personalInfo.personalPhoto!.readAsBytes();
  final pdfImage = pw.MemoryImage(personalPhoto);

  final educations = educationBloc.state is EducationLoadSuccess
      ? (educationBloc.state as EducationLoadSuccess).educations
      : <Education>[];
  final skills = skillBloc.state is SkillLoadSuccess
      ? (skillBloc.state as SkillLoadSuccess).skills
      : <Skill>[];

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.zero,
      build: (pw.Context context) {
        return pw.Container(
          padding: pw.EdgeInsets.zero,
          margin: pw.EdgeInsets.zero,
          width: contentWidth,
          height: contentHeight,
          decoration: pw.BoxDecoration(
              color: PdfColors.white,
              border: pw.Border.all(width: 1, color: PdfColors.black)),
          child: pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                  margin: pw.EdgeInsets.zero,
                  padding: pw.EdgeInsets.symmetric(vertical: 20),
                  width: contentWidth * 0.3,
                  height: contentHeight,
                  color: PdfColor.fromInt(0xff323b4c),
                  child: pw.Column(children: [
                    pw.Container(
                      width: 120,
                      height: 120,
                      decoration: pw.BoxDecoration(
                        shape: pw.BoxShape.circle,
                        image: pw.DecorationImage(
                          image: pdfImage,
                          fit: pw.BoxFit.cover,
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 20),
                    pw.Padding(
                      padding: pw.EdgeInsets.only(left: 20, right: 5),
                      child: pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.start,
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              "Contact",
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            pw.Divider(
                              color: PdfColors.white,
                              thickness: 1,
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text(
                              "Phone",
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            pw.SizedBox(height: 5),
                            pw.Text(
                              personalInfoBloc.personalInfo.phoneNumber,
                              style: pw.TextStyle(
                                  color: PdfColors.white, fontSize: 12),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text(
                              "Email",
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            pw.SizedBox(height: 5),
                            pw.Text(
                              personalInfoBloc.personalInfo.email,
                              style: pw.TextStyle(
                                  color: PdfColors.white, fontSize: 12),
                            ),
                            pw.SizedBox(height: 10),
                            pw.Text(
                              "Address",
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontSize: 14,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            pw.SizedBox(height: 5),
                            pw.Text(
                              personalInfoBloc.personalInfo.addressFirstLine,
                              style: pw.TextStyle(
                                  color: PdfColors.white, fontSize: 12),
                            ),
                            pw.SizedBox(height: 5),
                            pw.Text(
                              personalInfoBloc.personalInfo.addressSecondLine,
                              style: pw.TextStyle(
                                  color: PdfColors.white, fontSize: 12),
                            ),
                            pw.SizedBox(height: 20),
                            pw.Text(
                              "Education",
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            pw.Divider(
                              color: PdfColors.white,
                              thickness: 1,
                            ),
                            pw.SizedBox(height: 10),
                            ...educations.map((education) => pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    children: [
                                      pw.Row(children: [
                                        pw.Text(
                                          education.startDate != null
                                              ? "${education.startDate!.month.toString().padLeft(2, '0')}.${education.startDate!.year}"
                                              : "",
                                          style: pw.TextStyle(
                                              color: PdfColors.white,
                                              fontSize: 10),
                                        ),
                                        pw.Text(
                                          education.endDate != null
                                              ? " - ${education.endDate!.month.toString().padLeft(2, '0')}.${education.endDate!.year}"
                                              : "",
                                          style: pw.TextStyle(
                                              color: PdfColors.white,
                                              fontSize: 10),
                                        ),
                                        if (education.stillStudying == true)
                                          pw.Text(
                                            " - Present",
                                            style: pw.TextStyle(
                                                color: PdfColors.white,
                                                fontSize: 10),
                                          ),
                                      ]),
                                      pw.SizedBox(height: 5),
                                      pw.Text(
                                        education.major,
                                        style: pw.TextStyle(
                                            color: PdfColors.white,
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold),
                                      ),
                                      pw.SizedBox(height: 5),
                                      pw.Text(
                                        education.title,
                                        style: pw.TextStyle(
                                            color: PdfColors.white,
                                            fontSize: 12),
                                      ),
                                      pw.SizedBox(height: 5),
                                      pw.Text(
                                        education.description,
                                        style: pw.TextStyle(
                                            color: PdfColors.white,
                                            fontSize: 9),
                                      ),
                                      pw.SizedBox(height: 20),
                                    ])),
                            pw.Text(
                              "Skills",
                              style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontSize: 16,
                                  fontWeight: pw.FontWeight.bold),
                            ),
                            pw.Divider(
                              color: PdfColors.white,
                              thickness: 1,
                            ),
                            ...skills.map((s) => pw.Column(children: [
                                  pw.Text(
                                    s.name,
                                    style: pw.TextStyle(
                                        color: PdfColors.white,
                                        fontSize: 12,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                ]))
                          ]),
                    ),
                  ])),
              pw.Expanded(
                child: pw.Container(
                  margin: pw.EdgeInsets.zero,
                  padding: pw.EdgeInsets.symmetric(vertical: 20),
                  width: contentWidth * 0.7,
                  height: contentHeight,
                  color: PdfColors.red,
                ),
              )
            ],
          ),
        );
      },
    ),
  );

  // Save the PDF file
  final output = await getExternalStorageDirectory();
  final file = File("${output?.path}/example.pdf");
  await file.writeAsBytes(await pdf.save());
  print("CV PDF saved to ${file.path}");
  return file.path;
}

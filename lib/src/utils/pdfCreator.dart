import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../blocs/bloc_barrel.dart';
import '../models/models.dart';
import 'SkillLevel.dart';
import 'dropdownItems.dart';

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
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Container(
                  margin: pw.EdgeInsets.zero,
                  padding: pw.EdgeInsets.symmetric(vertical: 20),
                  width: contentWidth * 0.3,
                  height: contentHeight,
                  color: darkColor,
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
                            pw.SizedBox(height: 10),
                            if (personalInfoBloc.personalInfo.website != "")
                              pw.Text(
                                "Website",
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 14,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                            if (personalInfoBloc.personalInfo.website != "")
                              pw.SizedBox(height: 5),
                            if (personalInfoBloc.personalInfo.website != "")
                              pw.Text(
                                personalInfoBloc.personalInfo.website,
                                style: pw.TextStyle(
                                    color: PdfColors.white, fontSize: 12),
                              ),
                            pw.SizedBox(height: 10),
                            if (personalInfoBloc.personalInfo.linkedIn != "")
                              pw.Text(
                                "Linkedin",
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 14,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                            if (personalInfoBloc.personalInfo.linkedIn != "")
                              pw.SizedBox(height: 5),
                            if (personalInfoBloc.personalInfo.linkedIn != "")
                              pw.Text(
                                personalInfoBloc.personalInfo.linkedIn,
                                style: pw.TextStyle(
                                    color: PdfColors.white, fontSize: 12),
                              ),
                            pw.SizedBox(height: 10),
                            if (personalInfoBloc.personalInfo.instagram != "")
                              pw.Text(
                                "Instagram",
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 14,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                            if (personalInfoBloc.personalInfo.instagram != "")
                              pw.SizedBox(height: 5),
                            if (personalInfoBloc.personalInfo.instagram != "")
                              pw.Text(
                                personalInfoBloc.personalInfo.instagram,
                                style: pw.TextStyle(
                                    color: PdfColors.white, fontSize: 12),
                              ),
                            pw.SizedBox(height: 10),
                            if (personalInfoBloc.personalInfo.twitter != "")
                              pw.Text(
                                "Twitter",
                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontSize: 14,
                                    fontWeight: pw.FontWeight.bold),
                              ),
                            if (personalInfoBloc.personalInfo.twitter != "")
                              pw.SizedBox(height: 5),
                            if (personalInfoBloc.personalInfo.twitter != "")
                              pw.Text(
                                personalInfoBloc.personalInfo.twitter,
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
                            ...skills.map((s) => pw.Column(
                                    mainAxisAlignment:
                                        pw.MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                        s.name,
                                        style: pw.TextStyle(
                                            color: PdfColors.white,
                                            fontSize: 12,
                                            fontWeight: pw.FontWeight.bold),
                                      ),
                                      pw.SizedBox(height: 2),
                                      pw.Text(
                                        s.note,
                                        style: pw.TextStyle(
                                            color: PdfColors.white,
                                            fontSize: 9),
                                      ),
                                      pw.SizedBox(height: 2),
                                      skillLevelBuilder(s.level),
                                      pw.SizedBox(height: 10),
                                    ]))
                          ]),
                    ),
                  ])),
              pw.Expanded(
                child: pw.Container(
                  margin: pw.EdgeInsets.zero,
                  padding:
                      pw.EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                  width: contentWidth * 0.7,
                  height: contentHeight,
                  color: PdfColors.white,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    children: [
                      pw.Text(
                        "${personalInfoBloc.personalInfo.firstName} ${personalInfoBloc.personalInfo.lastName}",
                        style: pw.TextStyle(
                            color: darkColor,
                            fontSize: 36,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        "${personalInfoBloc.personalInfo.jobTitle}",
                        style: pw.TextStyle(
                            color: darkColor,
                            fontSize: 24,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        "${personalInfoBloc.personalInfo.summary}",
                        style: pw.TextStyle(color: darkColor, fontSize: 12),
                      ),
                      pw.SizedBox(height: 15),
                      pw.Text(
                        "Experience",
                        style: pw.TextStyle(
                            color: darkColor,
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Divider(
                        color: darkColor,
                        thickness: 1,
                      ),
                      ...experiences.map((e) => pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Row(children: [
                                  pw.Text(
                                    e.startDate != null
                                        ? "${e.startDate!.month.toString().padLeft(2, '0')}.${e.startDate!.year}"
                                        : "",
                                    style: pw.TextStyle(
                                        color: darkColor, fontSize: 10),
                                  ),
                                  pw.Text(
                                    e.finishDate != null
                                        ? " - ${e.finishDate!.month.toString().padLeft(2, '0')}.${e.finishDate!.year}"
                                        : "",
                                    style: pw.TextStyle(
                                        color: darkColor, fontSize: 10),
                                  ),
                                  if (e.stillWorking == true)
                                    pw.Text(
                                      " - Present",
                                      style: pw.TextStyle(
                                          color: darkColor, fontSize: 10),
                                    ),
                                ]),
                                pw.SizedBox(height: 5),
                                pw.Text(
                                  e.company,
                                  style: pw.TextStyle(
                                      color: darkColor, fontSize: 12),
                                ),
                                pw.SizedBox(height: 5),
                                pw.Text(
                                  e.position,
                                  style: pw.TextStyle(
                                      color: darkColor,
                                      fontSize: 14,
                                      fontWeight: pw.FontWeight.bold),
                                ),
                                pw.SizedBox(height: 5),
                                pw.Text(
                                  e.description ?? "",
                                  style: pw.TextStyle(
                                    color: darkColor,
                                    fontSize: 10,
                                  ),
                                ),
                                pw.SizedBox(height: 20),
                              ]))
                    ],
                  ),
                ),
              )
            ],
          )
        ];
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

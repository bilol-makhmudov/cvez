import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:cv_ez/src/models/Education.dart';
import 'package:cv_ez/src/models/Skill.dart';
import 'package:cv_ez/src/utils/pdfTextStyles.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../utils/SkillLevel.dart';

pw.Widget educationPdf({
  required PersonalInfoBloc personalInfoBloc,
  required pw.EdgeInsets contentPadding,
  required List<Education> educations,
}) {
  return pw.Container(
    child: pw.Padding(
      padding: contentPadding,
      child: pw.Column(
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Text("Education", style: titleStyle),
              ),
              pw.Expanded(
                child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      ...educations.map((education) => pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              children: [
                                pw.Text(
                                  education.major.toUpperCase(),
                                  style: bodyStyle,
                                ),
                                pw.SizedBox(height: 5),
                                pw.Row(children: [
                                  pw.Text(
                                    education.title,
                                    style: bodyStyle,
                                  ),
                                  pw.SizedBox(width: 5),
                                  pw.Container(
                                      width: 0.5,
                                      height: 10,
                                      color: PdfColors.black),
                                  pw.SizedBox(width: 5),
                                  pw.Text(
                                    education.startDate != null
                                        ? "${education.startDate!.month.toString().padLeft(2, '0')}.${education.startDate!.year}"
                                        : "",
                                    style: bodyStyle,
                                  ),
                                  pw.Text(
                                    education.endDate != null
                                        ? " - ${education.endDate!.month.toString().padLeft(2, '0')}.${education.endDate!.year}"
                                        : "",
                                    style: bodyStyle,
                                  ),
                                  if (education.stillStudying == true)
                                    pw.Text(
                                      " - Present",
                                      style: bodyStyle,
                                    ),
                                ]),
                                pw.SizedBox(height: 5),
                                pw.Text(
                                  education.description,
                                  style: bodyStyle,
                                ),
                                pw.SizedBox(height: 20),
                              ]))
                    ]),
              ),
            ],
          ),
          pw.Container(
              width: double.infinity, height: 1, color: PdfColors.black)
        ],
      ),
    ),
  );
}

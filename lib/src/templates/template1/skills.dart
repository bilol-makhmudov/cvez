import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:cv_ez/src/models/Skill.dart';
import 'package:cv_ez/src/utils/pdfTextStyles.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../utils/SkillLevel.dart';

pw.Widget skillsPdf({
  required PersonalInfoBloc personalInfoBloc,
  required pw.EdgeInsets contentPadding,
  required List<Skill> skillsData,
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
                child: pw.Text("Skills", style: titleStyle),
              ),
              pw.Expanded(
                child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      ...skillsData.map((s) => pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text(
                                  s.name,
                                  style: bodyStyle,
                                ),
                                pw.SizedBox(height: 2),
                                pw.Text(
                                  s.note,
                                  style: bodyStyle,
                                ),
                                pw.SizedBox(height: 2),
                                skillLevelBuilder(s.level),
                                pw.SizedBox(height: 10),
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

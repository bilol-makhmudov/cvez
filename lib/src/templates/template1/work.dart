import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:cv_ez/src/models/Experience.dart';
import 'package:cv_ez/src/utils/pdfTextStyles.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget workContainer({
  required PersonalInfoBloc personalInfoBloc,
  required pw.EdgeInsets contentPadding,
  required List<Experience> experiences,
}) {
  return pw.Container(
    child: pw.Padding(
      padding: contentPadding,
      child: pw.Column(
        children: [
          pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
            pw.Expanded(
              child: pw.Text("Experience", style: titleStyle),
            ),
            pw.Expanded(
                child: pw.Column(children: [
              ...experiences.map((e) => pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Text(e.position.toUpperCase(), style: bodyStyle),
                        pw.Row(children: [
                          pw.Text(
                            e.company,
                            style: bodyStyle,
                          ),
                          pw.SizedBox(width: 5),
                          if (e.finishDate != null)
                            pw.Container(
                                width: 0.5, height: 10, color: PdfColors.black),
                          pw.SizedBox(width: 5),
                          pw.Text(
                            e.startDate != null
                                ? "${e.startDate!.month.toString().padLeft(2, '0')}.${e.startDate!.year}"
                                : "",
                            style: bodyStyle,
                          ),
                          pw.Text(
                            e.finishDate != null
                                ? " - ${e.finishDate!.month.toString().padLeft(2, '0')}.${e.finishDate!.year}"
                                : "",
                            style: bodyStyle,
                          ),
                          if (e.stillWorking == true)
                            pw.Text(
                              " - Present",
                              style: bodyStyle,
                            ),
                        ]),
                        pw.SizedBox(height: 5),
                        pw.Text(e.description ?? "", style: bodyStyle),
                        pw.SizedBox(height: 20),
                      ]))
            ]))
          ]),
          pw.Container(
              width: double.infinity, height: 1, color: PdfColors.black)
        ],
      ),
    ),
  );
}

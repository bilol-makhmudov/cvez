import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

final pdf = pw.Document();
pw.Widget skillLevelBuilder(int? levelId) {
  return levelId != null
      ? pw.Stack(children: [
          pw.Container(
            width: 200,
            height: 5,
            decoration: pw.BoxDecoration(
                color: PdfColors.grey,
                borderRadius: pw.BorderRadius.circular(3)),
          ),
          pw.Container(
              width: ((levelId + 1) / 5) * 200,
              height: 5,
              decoration: pw.BoxDecoration(
                  color: PdfColors.black,
                  borderRadius: pw.BorderRadius.circular(3))),
          pw.Column(children: [
            pw.SizedBox(height: 5),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    "Novice",
                    style: pw.TextStyle(color: PdfColors.white, fontSize: 6),
                  ),
                  pw.Text(
                    "Expert",
                    style: pw.TextStyle(color: PdfColors.white, fontSize: 6),
                  )
                ])
          ])
        ])
      : pw.Container();
}

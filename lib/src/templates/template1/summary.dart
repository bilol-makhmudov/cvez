import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:cv_ez/src/utils/pdfTextStyles.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget summary({
  required PersonalInfoBloc personalInfoBloc,
  required pw.EdgeInsets contentPadding,
}) {
  return pw.Container(
    child: pw.Padding(
      padding: contentPadding,
      child: pw.Column(
        children: [
          pw.Text(personalInfoBloc.personalInfo.summary, style: bodyStyle),
          pw.SizedBox(height: 10),
          pw.Container(
              width: double.infinity, height: 1, color: PdfColors.black)
        ],
      ),
    ),
  );
}

import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Font? fontLibreBaskerville;
pw.Font? fontFigree;
final PdfColor darkColor = PdfColor.fromInt(0xff323b4c);

Future<void> loadCustomFont() async {
  final fontDataLibreBaskerville = await rootBundle
      .load('assets/fonts/Libre_Baskerville/LibreBaskerville-Regular.ttf');
  final fontDataFigtree = await rootBundle
      .load('assets/fonts/Figtree/Figtree-VariableFont_wght.ttf');

  fontLibreBaskerville =
      pw.Font.ttf(fontDataLibreBaskerville.buffer.asByteData());
  fontFigree = pw.Font.ttf(fontDataFigtree.buffer.asByteData());
}

pw.TextStyle headerFullNameStyle =
    pw.TextStyle(font: fontLibreBaskerville, color: darkColor, fontSize: 33);

pw.TextStyle jobTitleStyle =
    pw.TextStyle(font: fontFigree, color: darkColor, fontSize: 22);

pw.TextStyle titleStyle =
    pw.TextStyle(font: fontLibreBaskerville, color: darkColor, fontSize: 22);

pw.TextStyle bodyStyle =
    pw.TextStyle(font: fontFigree, color: darkColor, fontSize: 10);

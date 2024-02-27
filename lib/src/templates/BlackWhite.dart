import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfPreviewScreen extends StatefulWidget {
  final String pdfPath;

  PdfPreviewScreen({Key? key, required this.pdfPath}) : super(key: key);

  @override
  _PdfPreviewScreenState createState() => _PdfPreviewScreenState();
}

class _PdfPreviewScreenState extends State<PdfPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: widget.pdfPath,
    );
  }
}

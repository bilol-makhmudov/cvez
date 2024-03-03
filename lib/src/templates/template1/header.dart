import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../utils/pdfTextStyles.dart';

pw.Widget header(
    {required double headerWidth,
    required PersonalInfoBloc personalInfoBloc,
    required PdfColor headerBackgroundColor,
    required pw.EdgeInsets contentPadding,
    required pw.MemoryImage? personalPhoto}) {
  return pw.Container(
      width: headerWidth,
      color: headerBackgroundColor,
      child: pw.Padding(
          padding: contentPadding,
          child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(
                  child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "${personalInfoBloc.personalInfo.firstName} ${personalInfoBloc.personalInfo.lastName}",
                          style: headerFullNameStyle,
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          "${personalInfoBloc.personalInfo.jobTitle.toUpperCase()}",
                          style: jobTitleStyle,
                        ),
                        pw.SizedBox(height: 5),
                        if (personalPhoto != null)
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                contact(
                                    personalInfoBloc.personalInfo.phoneNumber),
                                contact(personalInfoBloc.personalInfo.email),
                                contact(personalInfoBloc.personalInfo.website),
                                contact(personalInfoBloc
                                    .personalInfo.addressFirstLine),
                                contact(personalInfoBloc
                                    .personalInfo.addressSecondLine),
                                contact(personalInfoBloc.personalInfo.linkedIn),
                                contact(
                                    personalInfoBloc.personalInfo.instagram),
                                contact(personalInfoBloc.personalInfo.twitter)
                              ]),
                      ]),
                ),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      if (personalPhoto != null)
                        pw.Container(
                          width: 200,
                          height: 200,
                          decoration: pw.BoxDecoration(
                            shape: pw.BoxShape.circle,
                            image: pw.DecorationImage(
                              image: personalPhoto,
                              fit: pw.BoxFit.cover,
                            ),
                          ),
                        ),
                      if (personalPhoto == null)
                        pw.Column(children: [
                          pw.Container(
                            width: 50,
                            height: 50,
                            decoration: pw.BoxDecoration(
                                shape: pw.BoxShape.circle,
                                border: pw.Border.all(width: 1)),
                            child: pw.Center(
                              child: pw.Text(
                                  personalInfoBloc.personalInfo.firstName[0] ??
                                      "",
                                  style: headerFullNameStyle),
                            ),
                          ),
                          pw.SizedBox(height: 5),
                          contact(personalInfoBloc.personalInfo.phoneNumber),
                          contact(personalInfoBloc.personalInfo.email),
                          contact(personalInfoBloc.personalInfo.website),
                          contact(
                              personalInfoBloc.personalInfo.addressFirstLine),
                          contact(
                              personalInfoBloc.personalInfo.addressSecondLine),
                          contact(personalInfoBloc.personalInfo.linkedIn),
                          contact(personalInfoBloc.personalInfo.instagram),
                          contact(personalInfoBloc.personalInfo.twitter)
                        ])
                    ]),
              ])));
}

pw.Widget contact(String? input) {
  if (input != "" || input != null) {
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.start,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(height: 5),
          pw.Text(input!, style: bodyStyle),
        ]);
  } else {
    return pw.SizedBox();
  }
}

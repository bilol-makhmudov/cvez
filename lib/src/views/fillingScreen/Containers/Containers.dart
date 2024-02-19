import 'package:flutter/material.dart';

import 'About.dart';
import 'Additional.dart';
import 'Contacts.dart';
import 'Containers.dart';
import 'Summary.dart';

export 'About.dart';
export 'Additional.dart';
export 'Contacts.dart';
export 'Education.dart';
export 'Work.dart';

final List pages = [
  AboutContainer(),
  ContactsContainer(),
  WorkContainer(),
  EducationContainer(),
  AdditionalContainer(),
  SummaryContainer(),
];

final List<IconData> iconsUnselected = [
  Icons.person_outline,
  Icons.phone_outlined,
  Icons.work_outline,
  Icons.school_outlined,
  Icons.add_box_outlined,
  Icons.book_outlined,
  Icons.done_all,
];

final List<IconData> iconsSelected = [
  Icons.person,
  Icons.phone,
  Icons.work,
  Icons.school,
  Icons.add_box,
  Icons.book,
  Icons.done_all,
];

final List<String> pageNames = [
  "About",
  "Contacts",
  "Work",
  "Education",
  "Additional",
  "Summary",
  "Download"
];

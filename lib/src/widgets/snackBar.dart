import 'package:flutter/material.dart';

SnackBar showCustomSnackBar(String text) {
  return SnackBar(
    content: Text(text),
    duration: Duration(days: 1),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {},
    ),
  );
}

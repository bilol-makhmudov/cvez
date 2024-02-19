import 'package:flutter/material.dart';

void showAddWorkExperience(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      double screenHeight = MediaQuery.of(context).size.height;
      double sheetHeight = screenHeight * 0.8;

      return Container(
        height: sheetHeight, // Use the calculated height here
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the sheet flexible
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Company Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Position',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Duration',
                  border: OutlineInputBorder(),
                ),
              ),
              // Add more fields as needed
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

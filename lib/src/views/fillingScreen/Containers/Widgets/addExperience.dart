import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:intl/intl.dart';

void showAddWorkExperience(BuildContext context) {
  TextEditingController _companyController = TextEditingController();
  TextEditingController _positionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool _stillWorking = false;
  DateTime? _startingDate = null;
  DateTime? _endingDate = null;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: _companyController,
                  decoration: InputDecoration(hintText: "Company name"),
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _positionController,
                  decoration: InputDecoration(hintText: "Position"),
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(hintText: "Location"),
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(hintText: "Description"),
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Start & End date"),
                    Spacer(),
                    Switch(
                        value: _stillWorking,
                        onChanged: (value) {
                          setState(() {
                            _stillWorking = value;
                          });
                        }),
                    Text("Currently work here"),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (() async {
                          _startingDate = await showMonthPicker(
                            context: context,
                            initialDate: DateTime.now(), // Today's date
                            firstDate: DateTime(1950, 5),
                            lastDate: DateTime(2050),
                          );
                          setState(() {
                            _endingDate;
                          });
                        }),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(width: 1.5, color: Colors.grey),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              _startingDate == null
                                  ? "MM/YYYY"
                                  : ("${DateFormat('MM/yyyy').format(_startingDate!)}"),
                              style: TextStyle(
                                  color: _startingDate == null
                                      ? Colors.grey
                                      : Colors.black,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Visibility(
                        visible: !_stillWorking,
                        child: InkWell(
                          onTap: (() async {
                            _endingDate = await showMonthPicker(
                              context: context,
                              initialDate: DateTime.now(), // Today's date
                              firstDate: DateTime(1950, 5),
                              lastDate: DateTime(2050),
                            );
                            setState(() {
                              _endingDate;
                            });
                          }),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1.5, color: Colors.grey),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                _endingDate == null
                                    ? "MM/YYYY"
                                    : ("${DateFormat('MM/yyyy').format(_endingDate!)}"),
                                style: TextStyle(
                                    color: _endingDate == null
                                        ? Colors.grey
                                        : Colors.black,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
    },
  );
}

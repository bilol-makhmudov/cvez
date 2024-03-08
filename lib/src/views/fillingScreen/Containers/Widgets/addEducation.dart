import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import '../../../../models/Education.dart';

void showAddWorkExperience(BuildContext context,
    {required Education education, required bool isUpdate}) {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _majorController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool _stillStudying = false;
  DateTime? _startingDate = null;
  DateTime? _endingDate = null;

  _titleController.text = education.title;
  _majorController.text = education.major;
  _descriptionController.text = education.description ?? "";
  _stillStudying = education.stillStudying ?? false;
  _startingDate = education.startDate;
  _endingDate = education.endDate;
  var _locale = Locale("en");

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BlocBuilder<EducationBloc, EducationState>(
          builder: (context, state) {
        final educationBloc = context.read<EducationBloc>();
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _titleController,
                      decoration: InputDecoration(hintText: "Title"),
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _majorController,
                      decoration: InputDecoration(hintText: "Major/Degree"),
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
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
                            value: _stillStudying,
                            onChanged: (value) {
                              setState(() {
                                _stillStudying = value;
                              });
                            }),
                        Text("Still studying"),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (() async {
                              _startingDate = await showMonthYearPicker(
                                context: context,
                                initialDate: _startingDate ?? DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2050),
                              );
                              setState(() {
                                _startingDate;
                              });
                            }),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.5, color: Colors.grey),
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
                            visible: !_stillStudying,
                            child: InkWell(
                              onTap: (() async {
                                _endingDate = await showMonthYearPicker(
                                  context: context,
                                  initialDate: _endingDate ?? DateTime.now(),
                                  firstDate: DateTime(1950),
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
                                    bottom: BorderSide(
                                        width: 1.5, color: Colors.grey),
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
                        final newEducation = Education(
                          title: _titleController.text,
                          major: _majorController.text,
                          description: _descriptionController.text,
                          startDate: _startingDate,
                          endDate: _stillStudying ? null : _endingDate,
                          stillStudying: _stillStudying,
                        );

                        if (isUpdate) {
                          newEducation.id = education.id;
                          educationBloc.add(EducationUpdated(newEducation));
                        } else {
                          educationBloc.add(EducationAdded(newEducation));
                        }
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
            ),
          );
        });
      });
    },
  );
}

import 'dart:math';

import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
import 'package:intl/intl.dart';
import '../../../../blocs/ExperienceBloc/experience_event.dart';
import '../../../../models/Experience.dart';

void showAddWorkExperience(BuildContext context,
    {required Experience experience, required bool isUpdate}) {
  TextEditingController _companyController = TextEditingController();
  TextEditingController _positionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool _stillWorking = false;
  DateTime? _startingDate = null;
  DateTime? _endingDate = null;

  _companyController.text = experience.company;
  _positionController.text = experience.position;
  _locationController.text = experience.location ?? "";
  _descriptionController.text = experience.description ?? "";
  _stillWorking = experience.stillWorking ?? false;
  _startingDate = experience.startDate;
  _endingDate = experience.finishDate;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BlocBuilder<ExperienceBloc, ExperienceState>(
          builder: (context, state) {
        final experienceBloc = context.read<ExperienceBloc>();
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
                      controller: _companyController,
                      decoration: InputDecoration(hintText: "Company name"),
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _positionController,
                      decoration: InputDecoration(hintText: "Position"),
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _locationController,
                      decoration: InputDecoration(hintText: "Location"),
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
                        final newExperience = Experience(
                          company: _companyController.text,
                          position: _positionController.text,
                          location: _locationController.text,
                          description: _descriptionController.text,
                          startDate: _startingDate,
                          finishDate: _stillWorking ? null : _endingDate,
                          stillWorking: _stillWorking,
                        );

                        if (isUpdate) {
                          newExperience.id = experience.id;
                          experienceBloc.add(ExperienceUpdated(newExperience));
                        } else {
                          experienceBloc.add(ExperienceAdded(newExperience));
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

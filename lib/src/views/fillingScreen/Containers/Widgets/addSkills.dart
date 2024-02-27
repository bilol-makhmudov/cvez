import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:flutter/material.dart';
import '../../../../models/models.dart';
import '../../../../utils/dropdownItems.dart';

void showAddSkills(BuildContext context,
    {required Skill skill, required bool isUpdate}) {
  int? _skillLevel;
  TextEditingController _skillNameController = TextEditingController();
  TextEditingController _noteController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BlocBuilder<SkillBloc, SkillState>(builder: (context, state) {
        SkillBloc skillBloc = context.read<SkillBloc>();
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
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        "Add your skills and save them one by one.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    TextField(
                      controller: _skillNameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: "Enter skill name"),
                    ),
                    DropdownButton(
                      icon: Icon(Icons.leaderboard_outlined),
                      isExpanded: true,
                      hint: Text("Choose skill level"),
                      value: _skillLevel,
                      onChanged: (value) {
                        setState(() {});
                        _skillLevel = value;
                      },
                      items: skillLevels
                          .map((key, value) {
                            return MapEntry(
                                key,
                                DropdownMenuItem(
                                    value: key, child: Text(value)));
                          })
                          .values
                          .toList(),
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                    ),
                    TextField(
                      textInputAction: TextInputAction.next,
                      controller: _noteController,
                      decoration: InputDecoration(hintText: "Note ..."),
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: (() {
                        final newSkill = Skill(
                          name: _skillNameController.text,
                          level: skillLevels[_skillLevel] ?? "",
                          note: _noteController.text,
                        );

                        if (isUpdate) {
                          newSkill.id = skill.id;
                          skillBloc.add(SkillUpdated(newSkill));
                        } else {
                          skillBloc.add(SkillAdded(newSkill));
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

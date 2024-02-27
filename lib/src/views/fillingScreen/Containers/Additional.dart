import 'package:cv_ez/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/bloc_barrel.dart';
import 'Widgets/addSkills.dart';

class AdditionalContainer extends StatefulWidget {
  const AdditionalContainer({super.key});

  @override
  State<AdditionalContainer> createState() => _AdditionalContainerState();
}

class _AdditionalContainerState extends State<AdditionalContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Your additional skills",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          BlocBuilder<SkillBloc, SkillState>(builder: (context, state) {
            if (state is SkillLoadSuccess) {
              if (state.skills.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.skills.length + 1,
                      itemBuilder: (context, index) {
                        if (index == state.skills.length) {
                          return _buildAddAdditionalSkillButton(context);
                        } else {
                          final skill = state.skills[index];
                          return SkillItem(skill: skill, context: context);
                        }
                      }),
                );
              } else {
                return _buildAddAdditionalSkillButton(context);
              }
            } else {
              return _buildAddAdditionalSkillButton(context);
            }
          }),
        ]),
      ),
    );
  }
}

Widget _buildAddAdditionalSkillButton(BuildContext context) {
  return InkWell(
    onTap: (() {
      showAddSkills(context,
          skill: Skill(name: '', level: '', note: ''), isUpdate: false);
    }),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Icon(Icons.add_circle_outline, color: Colors.blue),
            SizedBox(width: 10),
            Text(
              "Add skills",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue),
            )
          ],
        ),
      ),
    ),
  );
}

Widget SkillItem({required Skill skill, required BuildContext context}) {
  return InkWell(
    onTap: () {
      showAddSkills(context, skill: skill, isUpdate: true);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(skill.name,
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                SizedBox(height: 5),
                Text(skill.level,
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ],
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.blue),
              onPressed: () {
                context.read<SkillBloc>().add(SkillDeleted(skill.id));
              },
            ),
          ],
        ),
      ),
    ),
  );
}

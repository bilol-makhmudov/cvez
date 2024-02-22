import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:cv_ez/src/models/Experience.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widgets/addExperience.dart';

class WorkContainer extends StatefulWidget {
  const WorkContainer({Key? key}) : super(key: key);

  @override
  _WorkContainerState createState() => _WorkContainerState();
}

class _WorkContainerState extends State<WorkContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Your work experience",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          BlocBuilder<ExperienceBloc, ExperienceState>(
            builder: (context, state) {
              if (state is ExperienceLoadSuccess) {
                if (state.experiences.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.experiences.length + 1,
                      itemBuilder: (context, index) {
                        if (index == state.experiences.length) {
                          return _buildAddExperienceButton(context);
                        } else {
                          final experience = state.experiences[index];
                          return ExperienceItem(
                              experience: experience, context: context);
                        }
                      },
                    ),
                  );
                } else {
                  return _buildAddExperienceButton(context);
                }
              } else {
                return _buildAddExperienceButton(context);
              }
            },
          ),
        ]),
      ),
    );
  }
}

Widget _buildAddExperienceButton(BuildContext context) {
  return InkWell(
    onTap: (() {
      showAddWorkExperience(context,
          experience: Experience(company: "", position: ""), isUpdate: false);
    }),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Icon(Icons.add_circle_outline, color: Colors.blue),
            SizedBox(width: 10),
            Text(
              "Add work experience",
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

Widget ExperienceItem(
    {required Experience experience, required BuildContext context}) {
  return InkWell(
    onTap: () {
      showAddWorkExperience(context, experience: experience, isUpdate: true);
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
                Text(experience.company,
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                SizedBox(height: 5),
                Text(experience.position,
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ],
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.blue),
              onPressed: () {
                // Delete the experience
                context
                    .read<ExperienceBloc>()
                    .add(ExperienceDeleted(experience.id));
              },
            ),
          ],
        ),
      ),
    ),
  );
}

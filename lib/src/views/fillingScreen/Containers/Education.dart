import 'package:flutter/material.dart';
import '../../../blocs/bloc_barrel.dart';
import '../../../models/models.dart';
import 'Widgets/addEducation.dart';

class EducationContainer extends StatefulWidget {
  const EducationContainer({super.key});

  @override
  State<EducationContainer> createState() => _EducationContainerState();
}

class _EducationContainerState extends State<EducationContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Your education",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          BlocBuilder<EducationBloc, EducationState>(
            builder: (context, state) {
              if (state is EducationLoadSuccess) {
                if (state.educations.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.educations.length + 1,
                      itemBuilder: (context, index) {
                        if (index == state.educations.length) {
                          return _buildAddEducationButton(context);
                        } else {
                          final experience = state.educations[index];
                          return EducationItem(
                              education: experience, context: context);
                        }
                      },
                    ),
                  );
                } else {
                  return _buildAddEducationButton(context);
                }
              } else {
                return _buildAddEducationButton(context);
              }
            },
          ),
        ]),
      ),
    );
  }
}

Widget _buildAddEducationButton(BuildContext context) {
  return InkWell(
    onTap: (() {
      showAddWorkExperience(context,
          education: Education(title: '', major: '', description: ''),
          isUpdate: false);
    }),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: [
            Icon(Icons.add_circle_outline, color: Colors.blue),
            SizedBox(width: 10),
            Text(
              "Add Education",
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

Widget EducationItem(
    {required Education education, required BuildContext context}) {
  return InkWell(
    onTap: () {
      showAddWorkExperience(context, education: education, isUpdate: true);
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
                Text(education.title,
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                SizedBox(height: 5),
                Text(education.major,
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ],
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.blue),
              onPressed: () {
                context
                    .read<EducationBloc>()
                    .add(EducationDeleted(education.id));
              },
            ),
          ],
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import '../../../blocs/bloc_barrel.dart';
import '../../../models/models.dart';

class AboutContainer extends StatefulWidget {
  const AboutContainer({super.key});

  @override
  State<AboutContainer> createState() => _AboutState();
}

class _AboutState extends State<AboutContainer> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();

  void updateControllers(PersonalInfo state) {
    _firstNameController.text = state.firstName;
    _lastNameController.text = state.lastName;
    _jobTitleController.text = state.jobTitle;
  }

  @override
  void initState() {
    super.initState();
    final personalInfoBloc = context.read<PersonalInfoBloc>();
    personalInfoBloc.stream.listen((state) {
      if (state is PersonalInfoLoadSuccess) {
        updateControllers(state.personalInfo);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _jobTitleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        builder: (context, state) {
      if (state is PersonalInfoLoadSuccess) {
        updateControllers(state.personalInfo);
      }
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Personal Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            const InkWell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  radius: 30,
                  child: Icon(
                    Icons.person_add_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _firstNameController,
                decoration: InputDecoration(hintText: "First name"),
                onChanged: (value) {
                  context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                      context
                          .read<PersonalInfoBloc>()
                          .personalInfo
                          .copyWith(firstName: value)));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _lastNameController,
                decoration: InputDecoration(hintText: "Last name"),
                onChanged: (value) {
                  context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                      context
                          .read<PersonalInfoBloc>()
                          .personalInfo
                          .copyWith(lastName: value)));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _jobTitleController,
                decoration: InputDecoration(hintText: "Job title"),
                onChanged: (value) {
                  context.read<PersonalInfoBloc>().add(PersonalInfoUpdated(
                      context
                          .read<PersonalInfoBloc>()
                          .personalInfo
                          .copyWith(jobTitle: value)));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  "Fully filled CV looks better and higher chance of getting hired.",
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }
}

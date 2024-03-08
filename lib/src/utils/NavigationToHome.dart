import 'package:flutter/material.dart';
import '../blocs/bloc_barrel.dart';
import '../views/homeScreen/HomeScreen.dart';

void resetAndNavigateToHome(BuildContext context) {
  context.read<PersonalInfoBloc>().clearState();
  context.read<EducationBloc>().clearState();
  context.read<ExperienceBloc>().clearState();
  context.read<SkillBloc>().clearState();

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => HomeScreen()),
    (Route<dynamic> route) => false,
  );
}

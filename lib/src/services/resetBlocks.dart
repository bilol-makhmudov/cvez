import 'package:cv_ez/src/blocs/bloc_barrel.dart';

void resetBlocks({
  SkillBloc? skillBloc,
  EducationBloc? educationBloc,
  ExperienceBloc? experienceBloc,
  PersonalInfoBloc? personalInfoBloc,
}) {
  skillBloc?.add(ResetSkills());

  // educationBloc?.add(
  //     EducationEvent.reset()); // Replace with your event to reset the bloc
  // experienceBloc?.add(
  //     ExperienceEvent.reset()); // Replace with your event to reset the bloc
  // personalInfoBloc?.add(
  //     PersonalInfoEvent.reset()); // Replace with your event to reset the bloc
  // // Add reset for other blocs similarly
}

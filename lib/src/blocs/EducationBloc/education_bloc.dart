import 'package:cv_ez/src/models/Education.dart';

import '../bloc_barrel.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  EducationBloc() : super(EducationInitial()) {
    on<EducationUpdated>(_onEducationUpdated);
    on<EducationAdded>(_onEducationAdded);
    on<EducationDeleted>(_onEducationDeleted);
  }

  void _onEducationUpdated(
      EducationUpdated event, Emitter<EducationState> emit) {
    final currentState = state;
    if (currentState is EducationLoadSuccess) {
      final updatedEducation = currentState.educations.map((education) {
        if (education.id == event.education.id) {
          return event.education;
        }
        return education;
      }).toList();

      emit(EducationLoadSuccess(updatedEducation));
    }
  }

  void _onEducationAdded(EducationAdded event, Emitter<EducationState> emit) {
    final currentState = state;
    if (currentState is EducationLoadSuccess) {
      final updatedEducations = List<Education>.from(currentState.educations)
        ..add(event.education);
      emit(EducationLoadSuccess(updatedEducations));
    } else {
      emit(EducationLoadSuccess([event.education]));
    }
  }

  void _onEducationDeleted(
      EducationDeleted event, Emitter<EducationState> emit) {
    final currentState = state;
    if (currentState is EducationLoadSuccess) {
      final updatedEducation = currentState.educations
          .where((education) => education.id != event.id)
          .toList();
      emit(EducationLoadSuccess(updatedEducation));
    }
  }
}

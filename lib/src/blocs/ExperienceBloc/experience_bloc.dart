import '../../models/Experience.dart';
import '../bloc_barrel.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  ExperienceBloc() : super(ExperienceInitial()) {
    on<ExperienceAdded>(_onExperienceAdded);
    on<ExperienceUpdated>(_onExperienceUpdated);
    on<ExperienceDeleted>(_onExperienceDeleted);
  }

  void _onExperienceAdded(
      ExperienceAdded event, Emitter<ExperienceState> emit) {
    final currentState = state;
    if (currentState is ExperienceLoadSuccess) {
      final updatedExperiences = List<Experience>.from(currentState.experiences)
        ..add(event.experience);
      emit(ExperienceLoadSuccess(updatedExperiences));
    } else {
      emit(ExperienceLoadSuccess([event.experience]));
    }
  }

  void _onExperienceUpdated(
      ExperienceUpdated event, Emitter<ExperienceState> emit) {
    final currentState = state;
    if (currentState is ExperienceLoadSuccess) {
      final List<Experience> updatedExperiences = currentState.experiences
          .map((experience) => experience.id == event.experience.id
              ? event.experience
              : experience)
          .toList();
      emit(ExperienceLoadSuccess(updatedExperiences));
    }
  }

  void _onExperienceDeleted(
      ExperienceDeleted event, Emitter<ExperienceState> emit) {
    final currentState = state;
    if (currentState is ExperienceLoadSuccess) {
      final updatedExperiences = currentState.experiences
          .where((experience) => experience.id != event.id)
          .toList();
      emit(ExperienceLoadSuccess(updatedExperiences));
    }
  }
}

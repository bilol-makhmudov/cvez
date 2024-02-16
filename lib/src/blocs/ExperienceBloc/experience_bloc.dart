import '../bloc_barrel.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  ExperienceBloc() : super(ExperienceInitial()) {
    on<ExperienceAdded>(_onExperienceAdded);
    on<ExperienceUpdated>(_onExperienceUpdated);
    on<ExperienceDeleted>(_onExperienceDeleted);
  }

  void _onExperienceAdded(
      ExperienceAdded event, Emitter<ExperienceState> emit) {
    emit(ExperienceLoadSuccess([event.experience]));
  }

  void _onExperienceUpdated(
      ExperienceUpdated event, Emitter<ExperienceState> emit) {}

  void _onExperienceDeleted(
      ExperienceDeleted event, Emitter<ExperienceState> emit) {}
}

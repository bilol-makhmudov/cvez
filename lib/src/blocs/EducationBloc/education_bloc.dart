import '../bloc_barrel.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  EducationBloc() : super(EducationInitial()) {
    on<EducationUpdated>(_onEducationUpdated);
  }

  void _onEducationUpdated(
      EducationUpdated event, Emitter<EducationState> emit) {}
}

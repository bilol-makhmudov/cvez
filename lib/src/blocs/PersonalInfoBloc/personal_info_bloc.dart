import '../bloc_barrel.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfoBloc() : super(PersonalInfoInitial()) {
    on<PersonalInfoUpdated>((event, emit) {
      emit(PersonalInfoLoadSuccess(event.personalInfo));
    });
  }
}

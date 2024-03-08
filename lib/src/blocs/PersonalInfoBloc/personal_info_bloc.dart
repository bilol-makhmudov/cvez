import '../../models/PersonalInfo.dart';
import '../bloc_barrel.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  PersonalInfo personalInfo = PersonalInfo();

  PersonalInfoBloc() : super(PersonalInfoInitial()) {
    on<PersonalInfoUpdated>(_onPersonalInfoUpdated);
  }

  void _onPersonalInfoUpdated(
      PersonalInfoUpdated event, Emitter<PersonalInfoState> emit) {
    personalInfo = event.personalInfo;
    emit(PersonalInfoLoadSuccess(personalInfo));
  }

  void clearState() {
    emit(PersonalInfoInitial());
  }
}

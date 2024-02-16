import '../../models/models.dart';
import '../bloc_barrel.dart';

abstract class PersonalInfoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PersonalInfoUpdated extends PersonalInfoEvent {
  final PersonalInfo personalInfo;

  PersonalInfoUpdated(this.personalInfo);

  @override
  List<Object?> get props => [personalInfo];
}

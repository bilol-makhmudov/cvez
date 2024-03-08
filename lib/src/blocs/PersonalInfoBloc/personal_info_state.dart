import '../../models/models.dart';
import '../bloc_barrel.dart';

abstract class PersonalInfoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PersonalInfoInitial extends PersonalInfoState {}

class PersonalInfoLoadInProgress extends PersonalInfoState {}

class PersonalInfoLoadSuccess extends PersonalInfoState {
  final PersonalInfo personalInfo;

  PersonalInfoLoadSuccess(this.personalInfo);

  @override
  List<Object?> get props => [personalInfo];
}

class PersonalInfoLoadFailure extends PersonalInfoState {
  final String error;

  PersonalInfoLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class PersonalInfoUpdating extends PersonalInfoState {
  final PersonalInfo personalInfo;

  PersonalInfoUpdating(this.personalInfo);

  @override
  List<Object?> get props => [personalInfo];
}

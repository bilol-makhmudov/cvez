import '../../models/Education.dart';
import '../bloc_barrel.dart';

abstract class EducationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EducationInitial extends EducationState {}

class EducationLoadInProgress extends EducationState {}

class EducationLoadSuccess extends EducationState {
  final List<Education> educations;

  EducationLoadSuccess(this.educations);

  @override
  List<Object?> get props => [educations];
}

class EducationLoadFailure extends EducationState {
  final String error;

  EducationLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

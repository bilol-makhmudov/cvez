import '../bloc_barrel.dart';

abstract class EducationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class EducationInitial extends EducationState {}

class EducationLoadInProgress extends EducationState {}

class EducationLoadSuccess extends EducationState {
  final EducationState educationState;

  EducationLoadSuccess(this.educationState);

  @override
  List<Object?> get props => [educationState];
}

class EducationLoadFailure extends EducationState {
  final String error;

  EducationLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

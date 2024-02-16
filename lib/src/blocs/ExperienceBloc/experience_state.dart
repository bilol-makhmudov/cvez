import '../../models/models.dart';
import '../bloc_barrel.dart';

abstract class ExperienceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExperienceInitial extends ExperienceState {}

class ExperienceLoadInProgress extends ExperienceState {}

class ExperienceLoadSuccess extends ExperienceState {
  final List<Experience> experiences;

  ExperienceLoadSuccess(this.experiences);

  @override
  List<Object?> get props => [experiences];
}

class ExperienceLoadFailure extends ExperienceState {
  final String error;

  ExperienceLoadFailure(this.error);

  @override
  List<Object?> get props => [error];
}

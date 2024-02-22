import '../../models/models.dart';
import '../bloc_barrel.dart';

abstract class EducationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EducationUpdated extends EducationEvent {
  final Education education;

  EducationUpdated(this.education);

  @override
  List<Object?> get props => [education];
}

class EducationAdded extends EducationEvent {
  final Education education;

  EducationAdded(this.education);

  @override
  List<Object?> get props => [education];
}

class EducationDeleted extends EducationEvent {
  final String id;

  EducationDeleted(this.id);

  @override
  List<Object?> get props => [id];
}

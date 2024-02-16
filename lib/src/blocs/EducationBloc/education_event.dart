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

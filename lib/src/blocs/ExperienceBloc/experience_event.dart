import '../../models/models.dart';
import '../bloc_barrel.dart';

abstract class ExperienceEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExperienceAdded extends ExperienceEvent {
  final Experience experience;

  ExperienceAdded(this.experience);

  @override
  List<Object?> get props => [experience];
}

class ExperienceUpdated extends ExperienceEvent {
  final Experience experience;

  ExperienceUpdated(this.experience);

  @override
  List<Object?> get props => [experience];
}

class ExperienceDeleted extends ExperienceEvent {
  final String id;

  ExperienceDeleted(this.id);

  @override
  List<Object?> get props => [id];
}

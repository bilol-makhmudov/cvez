import '../../models/models.dart';
import '../bloc_barrel.dart';

abstract class SkillEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SkillAdded extends SkillEvent {
  final Skill skill;

  SkillAdded(this.skill);

  @override
  List<Object> get props => [skill];
}

class SkillUpdated extends SkillEvent {
  final Skill skill;

  SkillUpdated(this.skill);

  @override
  List<Object> get props => [skill];
}

class SkillDeleted extends SkillEvent {
  final String id;

  SkillDeleted(this.id);

  @override
  List<Object> get props => [id];
}

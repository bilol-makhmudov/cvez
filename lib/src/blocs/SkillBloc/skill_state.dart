import '../../models/models.dart';
import '../bloc_barrel.dart';

abstract class SkillState extends Equatable {
  @override
  List<Object> get props => [];
}

class SkillInitial extends SkillState {}

class SkillLoadInProgress extends SkillState {}

class SkillLoadSuccess extends SkillState {
  final List<Skill> skills;

  SkillLoadSuccess(this.skills);

  @override
  List<Object> get props => [skills];
}

class SkillLoadFailure extends SkillState {
  final String error;

  SkillLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}

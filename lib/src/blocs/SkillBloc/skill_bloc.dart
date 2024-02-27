import '../../models/models.dart';
import '../bloc_barrel.dart';

class SkillBloc extends Bloc<SkillEvent, SkillState> {
  SkillBloc() : super(SkillInitial()) {
    on<SkillAdded>(_onSkillAdded);
    on<SkillUpdated>(_onSkillUpdated);
    on<SkillDeleted>(_onSkillDeleted);
  }

  void _onSkillAdded(SkillAdded event, Emitter<SkillState> emit) {
    final currentState = state;
    if (currentState is SkillLoadSuccess) {
      final updatedSkill = List<Skill>.from(currentState.skills)
        ..add(event.skill);
      emit(SkillLoadSuccess(updatedSkill));
    } else {
      emit(SkillLoadSuccess([event.skill]));
    }
  }

  void _onSkillUpdated(SkillUpdated event, Emitter<SkillState> emit) {
    final currentState = state;
    if (currentState is SkillLoadSuccess) {
      final updatedSkill = currentState.skills.map((skill) {
        if (skill.id == event.skill.id) {
          return event.skill;
        }
        return skill;
      }).toList();

      emit(SkillLoadSuccess(updatedSkill));
    }
  }

  void _onSkillDeleted(SkillDeleted event, Emitter<SkillState> emit) {
    final currentState = state;
    if (currentState is SkillLoadSuccess) {
      final updatedSkill =
          currentState.skills.where((skill) => skill.id != event.id).toList();
      emit(SkillLoadSuccess(updatedSkill));
    }
  }
}

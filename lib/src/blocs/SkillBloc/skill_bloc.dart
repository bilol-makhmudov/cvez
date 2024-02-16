import '../../models/models.dart';
import '../bloc_barrel.dart';

class SkillBloc extends Bloc<SkillEvent, SkillState> {
  SkillBloc() : super(SkillInitial()) {
    on<SkillAdded>(_onSkillAdded);
    on<SkillUpdated>(_onSkillUpdated);
    on<SkillDeleted>(_onSkillDeleted);
  }

  void _onSkillAdded(SkillAdded event, Emitter<SkillState> emit) {
    final newState = List<Skill>.from((state as SkillLoadSuccess).skills)
      ..add(event.skill);
    emit(SkillLoadSuccess(newState));
  }

  void _onSkillUpdated(SkillUpdated event, Emitter<SkillState> emit) {}

  void _onSkillDeleted(SkillDeleted event, Emitter<SkillState> emit) {}
}

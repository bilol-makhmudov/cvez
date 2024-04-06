import '../../models/Template.dart';
import '../bloc_barrel.dart';
abstract class TemplatesEvent extends Equatable{
  const TemplatesEvent();

  @override
  List<Object> get props => [];
}

class TakeTemplatesURL extends TemplatesEvent {
  final List<Template> templates;
  const TakeTemplatesURL(this.templates);

  @override
  List<Object> get props => [templates];
}
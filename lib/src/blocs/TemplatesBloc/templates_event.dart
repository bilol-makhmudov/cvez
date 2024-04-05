import '../../models/Template.dart';
import '../bloc_barrel.dart';
abstract class TemplatesEvent extends Equatable{
  const TemplatesEvent();

  @override
  List<Object> get props => [];
}

class TakeTemplatesURL extends TemplatesEvent {
  List<Template> templates;

  TakeTemplatesURL(this.templates);

  @override
  List<Object> get props => [templates];
}
import 'package:equatable/equatable.dart';
import '../../models/Template.dart';

abstract class TemplatesState extends Equatable {
  const TemplatesState();

  @override
  List<Object> get props => [];
}

class TemplatesInitial extends TemplatesState {}

class TemplatesIsLoading extends TemplatesState {
  final bool isLoading;

  const TemplatesIsLoading({required this.isLoading});

  @override
  List<Object> get props => [isLoading];
}

class TemplatesSuccessState extends TemplatesState {
  final List<Template> templates;

  const TemplatesSuccessState(this.templates);

  @override
  List<Object> get props => [templates];
}

class TemplatesFailureState extends TemplatesState {
  final String errorMessage;

  const TemplatesFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

import '../bloc_barrel.dart';

abstract class FillingScreenState extends Equatable {
  const FillingScreenState();

  @override
  List<Object> get props => [];
}

class FillingScreenInitial extends FillingScreenState {}

class PageChanged extends FillingScreenState {
  final int pageIndex;
  final double screenWidth;

  PageChanged({required this.pageIndex, required this.screenWidth});

  @override
  List<Object> get props => [pageIndex, screenWidth];
}

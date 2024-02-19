import '../bloc_barrel.dart';

abstract class FillingScreenEvent extends Equatable {
  const FillingScreenEvent();

  @override
  List<Object> get props => [];
}

class PageTapped extends FillingScreenEvent {
  final int pageIndex;

  const PageTapped(this.pageIndex);
}

class PageIndicatorChanged extends FillingScreenEvent {
  final int pageIndex;
  final double screenWidth;

  const PageIndicatorChanged(this.screenWidth, this.pageIndex);
}

class NextPage extends FillingScreenEvent {
  const NextPage();
}

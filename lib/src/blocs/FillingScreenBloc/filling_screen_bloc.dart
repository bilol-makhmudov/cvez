import 'package:flutter/material.dart';
import '../bloc_barrel.dart';

class FillingScreenBloc extends Bloc<FillingScreenEvent, FillingScreenState> {
  final PageController pageController = PageController();
  final ScrollController iconScrollController = ScrollController();
  int currentPageIndex = 0;

  FillingScreenBloc() : super(FillingScreenInitial()) {
    on<PageTapped>(_onPageTapped);
    on<PageIndicatorChanged>(_onPageChanged);
  }

  Future<void> _onPageTapped(
      PageTapped event, Emitter<FillingScreenState> emit) async {
    if (pageController.hasClients) {
      currentPageIndex = event.pageIndex;
      pageController.animateToPage(
        currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _onPageChanged(

      /// Moves the row scroll of icons (page indicators)
      PageIndicatorChanged event,
      Emitter<FillingScreenState> emit) async {
    if (iconScrollController.hasClients) {
      currentPageIndex = event.pageIndex;
      double iconWidth = 80;
      double desiredScrollPosition =
          iconWidth * currentPageIndex - event.screenWidth / 2 + iconWidth / 2;
      desiredScrollPosition =
          desiredScrollPosition < 0 ? 0 : desiredScrollPosition;
      double maxScrollExtent = iconScrollController.position.maxScrollExtent;
      desiredScrollPosition = desiredScrollPosition > maxScrollExtent
          ? maxScrollExtent
          : desiredScrollPosition;

      iconScrollController.animateTo(
        desiredScrollPosition,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    emit(PageChanged(
        pageIndex: currentPageIndex, screenWidth: event.screenWidth));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    iconScrollController.dispose();
    return super.close();
  }
}

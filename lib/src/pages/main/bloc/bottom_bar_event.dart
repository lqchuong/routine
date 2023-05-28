part of 'bottom_bar_bloc.dart';

abstract class BottomBarEvent extends Equatable {
  const BottomBarEvent();

  @override
  List<Object> get props => [];
}

class BottomBarInitialEvent extends BottomBarEvent {
  int selectIndex = 1;
  BottomBarInitialEvent(this.selectIndex);
}

class OnItemTappedEvent extends BottomBarEvent {
  int selectIndex = 1;
  OnItemTappedEvent(this.selectIndex);
}

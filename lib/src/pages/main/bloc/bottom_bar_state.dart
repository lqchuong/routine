part of 'bottom_bar_bloc.dart';

abstract class BottomBarState extends Equatable {
  const BottomBarState();

  @override
  List<Object> get props => [];
}

class BottomBarInitial extends BottomBarState {}

class BottomBarInitialSuccessful extends BottomBarState {
  int selectIndex = 1;
  BottomBarInitialSuccessful(this.selectIndex);

  @override
  List<Object> get props => [selectIndex];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_bar_event.dart';
part 'bottom_bar_state.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  BottomBarBloc() : super(BottomBarInitial()) {
    on<BottomBarInitialEvent>(
        (BottomBarInitialEvent event, Emitter<BottomBarState> emit) {
      _bottomBarInitialEvent(event, emit);
      // TODO: implement event handler
    });

    on<OnItemTappedEvent>(
        (OnItemTappedEvent event, Emitter<BottomBarState> emit) {
      _onItemTappedEvent(event, emit);
      // TODO: implement event handler
    });
  }

  void _bottomBarInitialEvent(
      BottomBarInitialEvent event, Emitter<BottomBarState> emit) {
    emit(BottomBarInitialSuccessful(event.selectIndex));
  }

  void _onItemTappedEvent(
      OnItemTappedEvent event, Emitter<BottomBarState> emit) {
    print('_onItemTappedEvent');
    emit(BottomBarInitialSuccessful(event.selectIndex));
  }
}

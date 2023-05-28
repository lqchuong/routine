import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'slide_bar_event.dart';
part 'slide_bar_state.dart';

class SlideBarBloc extends Bloc<SlideBarEvent, SlideBarState> {
  SlideBarBloc() : super(SlideBarInitial()) {
    on<SlideBarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

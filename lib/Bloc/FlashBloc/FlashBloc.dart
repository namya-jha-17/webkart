import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkart/Bloc/FlashBloc/FlashEvent.dart';
import 'package:webkart/Bloc/FlashBloc/FlashState.dart';

class FlashBloc extends Bloc<FlashEvent,FlashState>{
  FlashBloc(super.initialState);

  @override
  FlashState get initialState => InitialFlashState();
  @override
  Stream<FlashState> mapEventToState(
      FlashEvent event,
      ) async* {
    if (event is NavigatetoNextEvent) {
      yield FlashLoadingState();

      // During the Loading state we can do additional checks like,
      // if the internet connection is available or not etc..

      await Future.delayed(Duration(seconds: 4)); // This is to simulate that above checking process
      yield FlashLoadedState(); // In this state we can load the HOME PAGE
    }
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkart/Bloc/FlashBloc/FlashEvent.dart';
import 'package:webkart/Bloc/FlashBloc/FlashState.dart';

class FlashBloc extends Bloc<FlashEvent,FlashState>{
  FlashBloc():super(InitialFlashState());

  @override
  FlashState get initialState => InitialFlashState();
 On<NavigatetoNextEvent>(event,emit)async{

     // This is to simulate that above checking process
      emit (FlashLoadedState()); // In this state we can load the HOME PAGE
    }
  }

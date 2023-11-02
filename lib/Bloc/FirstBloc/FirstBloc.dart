

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkart/Bloc/FirstBloc/FirstEvent.dart';
import 'package:webkart/Bloc/FirstBloc/FirstState.dart';

class FirstBloc extends Bloc<FirstEvent,FirstState> {
  FirstBloc() :super(InitialState()) {
    on<LoginEvent>((event, emit) async {
      emit(LoadLoginState());
    });

    on<RegisterEvent>((event, emit) async {
      emit(LoadRegisterState());
    });



  }


}
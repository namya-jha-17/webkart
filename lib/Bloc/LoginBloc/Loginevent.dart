import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginEvent {}

class LoginSubmit extends LoginEvent{
  final String emailVal;



  final String PassVal;
  LoginSubmit(this.emailVal, this.PassVal);

}
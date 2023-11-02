
import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginState{}

class LogininitialState extends LoginState{}
class LoginInvalidState extends LoginState{

  final String Emessege;

  LoginInvalidState(this.Emessege);
}
class LoginValidState extends LoginState{


}
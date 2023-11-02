import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkart/Bloc/LoginBloc/LoginState.dart';
import 'package:webkart/Bloc/LoginBloc/Loginevent.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc():super(LogininitialState()){
    on<LoginSubmit>((event,emit){
      if( (event.emailVal)=='' &&(event.PassVal =='')

       //   (EmailValidator.validate(event.emailVal)==false)
      )
          // &&(event.PassVal =='')&&
          // (event.PassVal.length<5))
      {
        emit(LoginInvalidState("invalid Credentials"));
        print("invalid Email");
        print(event.emailVal);
        print((event.PassVal));

      }

      else {
        emit(LoginValidState()
        );
      }
    });
  }
}
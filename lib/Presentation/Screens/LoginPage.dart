import 'package:animate_gradient/animate_gradient.dart';
import 'package:animated_gradient/animated_gradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkart/Bloc/CategoryBloc/CategoryBloc.dart';
import 'package:webkart/Bloc/LoginBloc/LoginState.dart';
import 'package:webkart/Bloc/LoginBloc/Loginevent.dart';
import 'package:webkart/Presentation/Screens/Categorypage.dart';

import '../../Bloc/LoginBloc/LoginBloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
late LoginBloc loginbloc;
CategoryBloc categoryBloc=CategoryBloc();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginbloc=BlocProvider.of<LoginBloc>(context);

}
  // void _login() {
  //   // Add your login logic here
  //
  //   // Example validation
  //   if (email.isEmpty || password.isEmpty) {
  //    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("invalid credentials")));
  //
  //   }
  //   else
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CategoryPage()));
  //   // Perform the login action here, e.g., send a request to your backend
  //   // and handle the response.
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      body: BlocBuilder<LoginBloc,LoginState>(
          builder: ( context,state){
            return AnimateGradient(


        primaryColors: [ Colors.white,
          Colors.blue,
          Colors.lightBlueAccent,
          Colors.deepPurpleAccent,
          Colors.purpleAccent,
          Colors.pinkAccent
        ],
        secondaryColors: [
          Colors.grey,
          Colors.greenAccent,
          CupertinoColors.activeGreen,
          Colors.green,
          Colors.brown,
          Colors.white
        ],
        child:
           Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(" Let you sign in!!",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                  Text(" Welcome Back ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100),),
SizedBox(height: 80,),

                  Card(elevation: 30,color: Colors.lightBlue[50],
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(labelText: 'Email',enabledBorder:OutlineInputBorder()),

                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(labelText: 'Password',enabledBorder:OutlineInputBorder() ),
                            obscureText: true, // Hide the password
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed:(){
                              loginbloc.add(LoginSubmit(emailController.text,passwordController.text));
                              print(emailController.text);
                              print(passwordController.text);
                              if (state is LoginValidState) {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=>BlocProvider.value(
                                    value: categoryBloc,child: CategoryPage(),
                                  ),),
                                );
                              }
                             else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("invalid credentials")));
                                }
                              },
                            child: Text('Login'),
                          ),
                        ],
                      ),
                    ),
                  ),
                    ],
                  ),

            ),
          )
            );
          }
        ),
          );

  }
}
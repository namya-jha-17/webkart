import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkart/Bloc/FirstBloc/FirstBloc.dart';
import 'package:webkart/Bloc/FlashBloc/FlashBloc.dart';
import 'package:webkart/Bloc/FlashBloc/FlashEvent.dart';
import 'package:webkart/Bloc/FlashBloc/FlashState.dart';
import 'package:webkart/Bloc/LoginBloc/LoginBloc.dart';
import 'package:webkart/Presentation/Screens/Categorypage.dart';
import 'package:webkart/Presentation/Screens/FirstPage.dart';
import 'package:webkart/Presentation/Screens/ListScreen.dart';
import 'package:webkart/Presentation/Screens/LoginPage.dart';
import 'package:webkart/main.dart';

import '../../Bloc/CategoryBloc/CategoryBloc.dart';
import '../../Bloc/CategoryBloc/Categoryevent.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> with SingleTickerProviderStateMixin {
  late FirstBloc firstBloc;
  //late LoginBloc loginBloc;
 late final  AnimationController _controller= AnimationController(
     vsync: this,duration: Duration(seconds: 4))..repeat(reverse: true,);
 late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset(0,0),
    end:  Offset(8.0,0),
  ).animate(CurvedAnimation(
    parent:_controller, curve: Curves.elasticInOut



  ));
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
   firstBloc= BlocProvider.of<FirstBloc>(context);
   Timer(Duration(seconds: 5),
           ()=> Navigator.pushReplacement(
               context,
               MaterialPageRoute(
               builder: (ctx) => BlocProvider.value(
     value: firstBloc,
     child: FirstPage(),
   ),
               ),
   ),

    ) ;


    // Timer(Duration(seconds: 5),
    //         ()=> Navigator.pushReplacement(
    //             context,
    //             MaterialPageRoute(
    //             builder: (ctx) => BlocProvider.value(
    //   value: _flashBloc,
    //   child: LoginForm(),
    // ),
    //             ),
    // ),
    // );
 }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

   return
     SlideTransition(
       position: _offsetAnimation,
       child: Icon(CupertinoIcons.cart,size: 100,));



  }
}

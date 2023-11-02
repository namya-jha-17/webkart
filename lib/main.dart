import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkart/Bloc/FirstBloc/FirstBloc.dart';
import 'package:webkart/Bloc/FlashBloc/FlashBloc.dart';
import 'package:webkart/Bloc/LoginBloc/LoginBloc.dart';
import 'package:webkart/Presentation/Screens/Categorypage.dart';
import 'package:webkart/Presentation/Screens/FirstPage.dart';
import 'package:webkart/Presentation/Screens/FlashScreen.dart';
import 'package:webkart/Presentation/Screens/ListScreen.dart';
import 'package:webkart/Presentation/Screens/LoginPage.dart';

import 'Bloc/CartBloc/CartBloc.dart';
import 'Bloc/CategoryBloc/CategoryBloc.dart';
import 'Bloc/FlashBloc/FlashState.dart';
import 'Bloc/ListBloc/productBloc.dart';
// late ProductBloc productbloc;
//late CartBloc cbloc;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent
        ),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(providers: [
    BlocProvider<ProductBloc>(create: (context)=>ProductBloc(),),
    BlocProvider<CartBloc>(create: (context)=>CartBloc(),),
        BlocProvider<CategoryBloc>(create: (context)=>CategoryBloc()),
        BlocProvider<FlashBloc>(create: (context)=>FlashBloc(),),
        BlocProvider<LoginBloc>(create: (context)=>LoginBloc(),),
        BlocProvider<FirstBloc>(create: (context)=>FirstBloc(),),

    ],
    child: Scaffold(
    body:  BlocBuilder<FlashBloc,FlashState>(
    builder: (context,state) {

    if(state is FlashLoadingState||state is InitialFlashState) {
      print("hi");
    return Center(child: FlashScreen());
    }
   else return BlocProvider(create:(context) => FirstBloc(), child: FirstPage());
          }

    ),
      ),),
    );
  }
}


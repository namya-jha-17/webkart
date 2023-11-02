import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkart/Bloc/FirstBloc/FirstBloc.dart';
import 'package:webkart/Bloc/FirstBloc/FirstEvent.dart';
import 'package:webkart/Bloc/FirstBloc/FirstState.dart';
import 'package:webkart/Bloc/LoginBloc/LoginBloc.dart';
import 'package:webkart/Presentation/Screens/LoginPage.dart';

class FirstPage extends StatefulWidget {

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
late FirstBloc firstBloc;
 LoginBloc loginBloc=LoginBloc();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstBloc=BlocProvider.of<FirstBloc>(context);
  //  loginBloc=BlocProvider.of<LoginBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: BlocConsumer<FirstBloc,FirstState>(

            listener: (BuildContext context,value){},
            builder: (context,state){
              return ListView(
              children: [
                SizedBox(height: 300,),
               Padding(
                 padding: const EdgeInsets.all(8.0),

                 child: Center(child: Image(image: AssetImage("Asset/First.png"),)
                    ,),
               ),
                Text("Welcome To Webkart"),
                ElevatedButton(onPressed: (){
print('hiiiii');
Navigator.push(
    context, MaterialPageRoute(
    builder: (ctx)=>BlocProvider.value(value:loginBloc ,child:  LoginForm(),)

    ),

);

                },
                    child: Text("Login")),
                ElevatedButton(onPressed: (){

                  //  firstBloc.add(RegisterEvent());
                  }, child: Text("Register")),
              ],
            );
              },


          ),
        );


  }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   firstBloc.close();
  // }
}

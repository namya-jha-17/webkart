
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../Bloc/CartBloc/CartBloc.dart';
import '../../Bloc/CartBloc/CartEvent.dart';
import '../../Bloc/CartBloc/CartState.dart';
import '../../Data/Payment/razorpay.dart';
import '../../Data/Repository/Repo.dart';

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
 // late ListProvider provider;

late CartBloc cbloc;
  @override
  void initState() {
    cbloc=BlocProvider.of<CartBloc>(context,listen: false);
    // TODO: implement initState
    super.initState();

   //BlocProvider.of(context, listen: false);

  }

  @override
  Widget build(BuildContext context) {
    RazorpayIntegration rp=RazorpayIntegration();
    final Razorpay _razorpay = Razorpay();

    Repo repo= Repo();
    return BlocBuilder<CartBloc,CartState>(

      builder: (context,state){
      return Scaffold(
        backgroundColor: Color.fromARGB(0, 100, 0, 10),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount:  state.cartList.length,
                  // to do
                  itemBuilder: ( context, int index) {

                    return ListTile(
                      leading: SizedBox(
                        width: 70,
                        height: 50,
                        child: Image.network('${state.cartList[index].thumbnail}'),
                      ),
                      title: Text('${state.cartList[index].title}'),
                      subtitle: Container(
                        width: 60,
                        height: 20,
                        child: Row(

                          children: [
                            IconButton(
                                onPressed: () {
                      //             print('-- is called ');
                      //                cartBloc=BlocProvider.of<CartBloc>(context);
                      // cartBloc.add(InCqty(state.cartList[index]));
                      //   // print("+tapped");
// state.cartList[index].quantity++;
// print("qty:${state.cartList[index].quantity++}");
                                },
                                icon: Icon(CupertinoIcons.minus_square)),

                            SizedBox(height: 20, width: 20,

                              child:

                            Text("${state.cartList[index].quantity}"
                            ),
                            ),

                           IconButton(
                              onPressed: () {
                               // final incbloc = context.read<CartBloc>();

                                // final incbloc = context.read<CartBloc>();
                                cbloc.add(InCqty((state.cartList[index].quantity)));

                                // print(state.cartList[index].quantity);
                                 print('++ is called ');
                              },
                              icon: const Icon(CupertinoIcons.plus_app,size: 30,),
                            ),

                            Text("${state.cartList[index].price}",)
                          ],
                        ),
                      ),
                      tileColor:Colors.blueGrey
                     ,
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                         //   cbloc=BlocProvider.of<CartBloc>(context);
                            cbloc.add(RemovefromCartevent(state.cartList[index]));
                          }
                      ),
                    );
                  }),
              Container(
              height: 200,
              child: Center(child: Text("TOTAL:  ${repo.Total(state.cartList)}",style: TextStyle(color:  Colors.white)),
              ),
              ),

              ElevatedButton(onPressed: (){
    var options = {
    // Razorpay API Key
    'key': 'rzp_test_gdimSExJ4x5XMz',
    // in the smallest
    // currency sub-unit.
    'amount': repo.Total(state.cartList)*100,
    'name': 'namya jha',

    'description':
    'testing',
      'upi_id':'namya.ha@okaxis',
    // in seconds
    'timeout': 300,
    'prefill': {
    'contact': '7065175245',
    'email': 'namya.ha@gmail.com'
    }
    };
                _razorpay.open(options);

              }, child: Text("Check Out"),)
            ],
          ),


        ),
      );}
    );

  }
}

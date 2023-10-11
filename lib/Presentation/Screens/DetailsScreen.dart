import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/CartBloc/CartBloc.dart';
import '../../Bloc/CartBloc/CartEvent.dart';
import '../../Data/Model/ResponseModel.dart';
import 'CartPage.dart';






class DetailsScreen extends StatefulWidget {
  // late Drinks drinks;
 Product product;

  DetailsScreen(this.product);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
// Future<List<Product>> Productlist=[];

  late CartBloc cbloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //drinklist = _getDetails(widget.idDrink);
  }

  @override
  Widget build(BuildContext context) {
  cbloc=BlocProvider.of<CartBloc>(context);
    return Scaffold(backgroundColor: CupertinoColors.black,
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [Stack(children: [
                Container(height: 400, width: MediaQuery
                    .of(context)
                    .size
                    .width,
                  decoration: BoxDecoration(image: DecorationImage(image:
                  NetworkImage("${widget.product.thumbnail}",), fit: BoxFit.fill


                  ),)
                  ,),
                Positioned(bottom: 30, left: 40,
                  child: Container(width: 200,
                    child: Text("${widget.product.title}", softWrap: true,
                      style: TextStyle(fontWeight: FontWeight.bold,
                          color: CupertinoColors.white, fontSize: 30),
                    ),
                  ),
                ),
              ],

              ),
                Container(height: 300,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40,),

                      Text("${widget.product.category} ",
                        style: TextStyle(
                            fontSize: 10, color: CupertinoColors.white),),
                      Text("${widget.product.category} ",
                        style: TextStyle(
                            fontSize: 10, color: CupertinoColors.white),),
                      SizedBox(height: 30,),
                     // Text("Juice:", style: TextStyle(fontWeight: FontWeight.bold,
                        //  color: CupertinoColors.white),),
                      Text("${widget.product.brand} ",
                        style: TextStyle(
                            fontSize: 10, color: CupertinoColors.white),),
                      Text("${widget.product.price} ",
                        style: TextStyle(
                            fontSize: 10, color: CupertinoColors.white),),
                      Text("${widget.product.stock} ${widget.product.rating}",
                        style: TextStyle(
                            fontSize: 10, color: CupertinoColors.white),),


                    ],
                  ),
                ),
                Center(child: ElevatedButton(onPressed: () {
                  final cartBloc = context.read<CartBloc>();
                    cartBloc.add(addToCartevent(widget.product));
                   Navigator.push(context, MaterialPageRoute(builder: (newctx) =>
                       BlocProvider.value(value: cbloc,child:CartList())));
                }, child: Text("Add to Cart"),)),

                Center(child: ElevatedButton(onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (ctx)=>StepScreen(snapshot.data!.first.idDrink)));
                }, child: Text("Buy Now"),)),
              ]),
      ),
        );

  }
}


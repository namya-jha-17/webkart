


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/CartBloc/CartBloc.dart';
import '../../Bloc/CartBloc/CartEvent.dart';
import '../../Bloc/ListBloc/productBloc.dart';
import '../../Bloc/ListBloc/productState.dart';
import '../../Bloc/ListBloc/productevent.dart';
import 'CartPage.dart';
import 'DetailsScreen.dart';

class ListScreen extends StatefulWidget {
  // List<ResponseModel> drinks;
  //
  // ListScreen({required this.drinks});

  @override
  State<ListScreen> createState() => _ListScreenState();

  const ListScreen({super.key});
}

class _ListScreenState extends State<ListScreen> {
  ProductBloc productBloc = ProductBloc();
  late CartBloc cbloc;

  @override
  void initState() {
    super.initState();
    productBloc =
        BlocProvider.of<ProductBloc>(context , listen: false);
    productBloc.add(LoadProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    cbloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
        backgroundColor: CupertinoColors.black,
        appBar: AppBar(
          backgroundColor: Colors.white10,
          actions: [
            const Icon(CupertinoIcons.search),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (newContext) =>

                            BlocProvider.value(value: cbloc,child:CartList()),));
                },
                icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
            builder: (BuildContext context, state) {
          if (state is ProductLoading) {
            return CircularProgressIndicator();
          } else if (state is ProductLoadedState) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  itemCount: state.products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 4.5,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => BlocProvider.value(value: cbloc,child:
                                    DetailsScreen(state.products[index]),
                                ),
                            ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Container(
                                height: 200,
                                width: 150,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        state.products[index].thumbnail,
                                      ),
                                      //fit: BoxFit.fill
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: GestureDetector(
                                child: Icon(CupertinoIcons.cart,color: Colors.white,),
                                onTap: () {
                                  final cartBloc = context.read<CartBloc>();
                                  final cartItems =cartBloc.state.cartList;
                                  if(cartItems.any(
                                          (element) => element.id==state.products[index].id)){
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Already added in cart"),
                                      duration: Duration(seconds: 2),
                                    ));
                                  } else {
                                    cartBloc.add(
                                        addToCartevent(
                                            state.products[index]));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                        content: Text("Add to Cart"),
                                        duration: Duration(seconds: 2),
                                  ));
                                  print('addv TO cart succesfully');}
                                },
                              ),
                              right: 10,
                              bottom: 10,
                            )
                          ]),
                          Text(
                            state.products[index].title,
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.white),
                          )
                        ],
                      )

                      ,
                    );


                  }),
            );
            //: Center(child: CircularProgressIndicator(),);
          }

          return Container();
        }));
  }
}

/*
 //   drinklist,
          //future:apiServices.getData(),
          // builder: (context, snapshot,child) {
          //   print('this is the snapshot :${snapshot.drinks.length ?? []}');
          //   if (snapshot.hasData) {
          //     return Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: GridView.builder(
          //           itemCount: snapshot.data?.length,
          //
          //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //             childAspectRatio: 3/4.5,
          //               mainAxisSpacing: 10,
          //               crossAxisCount: 2,
          //               crossAxisSpacing: 5),
          //           itemBuilder: (BuildContext context, int index) {
          //             return Container(
          //                  // height: 200,
          //                  // width: 150,
          //
          //                 child:InkWell(onTap:(){
          //                   Navigator.push(context, MaterialPageRoute(builder: (ctx)=>DetailsScreen(snapshot.data![index].idDrink)));
          //                 },child: ListWidget(rModel: snapshot.data![index],),),
          //             );
          //                     // Image.network(snapshot.data![index].strDrinkThumb));
          //           }),
          //     );
          //   } else {
          //     return Center(child: CircularProgressIndicator());
          //   }
          // }
 */

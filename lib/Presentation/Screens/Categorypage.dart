import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webkart/Bloc/CategoryBloc/CategoryBloc.dart';
import 'package:webkart/Bloc/CategoryBloc/CategoryState.dart';
import 'package:webkart/Bloc/CategoryBloc/Categoryevent.dart';
import 'package:webkart/Bloc/ListBloc/productBloc.dart';
import 'package:webkart/Data/ApiServices/ProductApi/ApiServices.dart';

import 'ListScreen.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
late CategoryBloc catbloc;
ProductBloc productBloc=ProductBloc();
  ApiClient api=ApiClient(Dio());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    try{
      catbloc=BlocProvider.of<CategoryBloc>(context , listen: false);
      catbloc.add(LoadCategoryEvent());

      // productbloc=BlocProvider.of<ProductBloc>(context);
      // cbloc=BlocProvider.of<CartBloc>(context);
    }
        catch(err){print(err);
    }
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        actions: [
      SizedBox(width:100,child: SearchBar( )),
        IconButton(onPressed: (){



        }, icon: Icon(CupertinoIcons.search),

        ),

        ],
      ),

      body:BlocBuilder<CategoryBloc,CategoryState>(

          builder: (BuildContext  context, state) {
            if(state is CategoryLoadedState){

            return Center(
              child: Container(height: 800,
                width: MediaQuery.of(context).size.width,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 100,
                  diameterRatio: 1.2,
                  useMagnifier: true,
                  magnification: 1.2,
                  physics: FixedExtentScrollPhysics(),

                     childDelegate: ListWheelChildBuilderDelegate(
                         childCount: state.categories.length,
                         builder: (BuildContext context, int index) {
                          return InkWell(
                            child: Container(child: Center(
                         child: Text(state.categories?[index]??" namya",
                         style: TextStyle(color:  CupertinoColors.black),
                         ),
                       ),width: 150,
                         height: 100,
                         decoration: BoxDecoration(color: Colors.greenAccent,
                               borderRadius: BorderRadius.all(Radius.circular(17))),
              ),
                    onTap: (){ Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>BlocProvider.value(value: productBloc,child:

                              ListScreen(state.categories[index])),
                        )
                    );
                              },
                          );
                       }

                    ),
                  ),
                ),
              );
            }
              else
                return Center(child: CircularProgressIndicator());


                  }

                  ),


    );


          }

  }


import 'package:dio/dio.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkart/Bloc/ListBloc/productState.dart';
import 'package:webkart/Bloc/ListBloc/productevent.dart';

import '../../Data/ApiServices/ProductApi/ApiServices.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{

ProductBloc() : super(ProductLoading()){
  on<LoadProductEvent>((event, emit)async {
    emit(ProductLoading());
    ApiClient apiClient =ApiClient(Dio());
    try{
      final productlist = await apiClient.getProduct();
      print(productlist.toString());
      emit(ProductLoadedState(productlist.products));
    }catch(err){
      print(err);
    }

  });
}

//   ProductBloc():(super.initialState){
//
//   On<LoadProductEvent>(event,emit) async{
//
//
// emit(ProductLoading());
// final productlist = await apiClient.getProduct();
// ProductLoadedState(productlist);
// }
//
//   // if(productlist.isEmpty)
//   //      ProductErrorState("oops ... something went wrong");
//
// }
//

}
  // TODO: implement on





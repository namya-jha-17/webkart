

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data/Model/ResponseModel.dart';
import '../../Data/Repository/Repo.dart';
import 'CartEvent.dart';
import 'CartState.dart';

class CartBloc extends Bloc<Cartevent,CartState> {
  Repo repo = Repo();

  CartBloc() :super(CartState([])) {
    on<Cartevent>(_mapEventToState);
 //   on<InCqty>(Incresestate(repo.incqty(state.cartList[index]));

  }

  Future<void> _mapEventToState(Cartevent event,
      Emitter<CartState> emit) async {
    if (event is addToCartevent) {
      final updatedcart = List<Product>.from(state.cartList)
        ..add(event.product);

      emit(CartState(updatedcart));

    }

    else if (event is RemovefromCartevent){
      final updatedcart=List<Product>.from(state.cartList)
          ..remove(event.product);
      emit(CartState(updatedcart));
    }
else if(event is InCqty){

      print(event.qty);
  //final quant= repo.incqty(event.qty);
      
   event.qty+1;
    //  print(quant);
      emit( Incresestate(event.qty+1));
    }

  }


//Product product;


// CartBloc():super(InitailState()){
//   on<addToCartevent> (_addCart);
// }
//
// void _addCart(addToCartevent event ,Emitter<CartState> emit){
//   emit(CartListState(repo.AddtoCart(event.product)));
//
// }
}

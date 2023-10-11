
import 'package:equatable/equatable.dart';

import '../../Data/Model/ResponseModel.dart';

 class CartState extends Equatable{

 // Product get prod => c;
final   List<Product> cartList ;

CartState(this.cartList);

  @override
  // TODO: implement props
  List<Object?> get props => cartList;

}
class Incresestate extends CartState{

int qty;
// @override
//List<Object?> get props => [qty];

Incresestate(this.qty) : super([]) ;
  @override

 List<Object?> get props => cartList;
}

class InitailState extends CartState{
  InitailState(super.cartList);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//
// class LoadingState extends CartState{}
//
// class SuccessState extends CartState{
//   List<Product> cartList = [];
//   SuccessState(this.cartList);
// }
//
// class CartListState extends CartState{
//   List<Product> cartList =[];
//   CartListState(this.cartList);
// }





// import 'package:equatable/equatable.dart';
//
// import '../../Model/ResponseModel.dart';
//
// abstract class CartState extends Equatable {
//   late Product product;
//   Product get _product => product;
//   List<Product> cartlist=[];
//   CartState( this.cartlist);
//
//   // List<Object?> get Props=>[cartlist];
// }
//
//
//
// class AddtocartState  extends CartState{
//   List<Product> cartlist =[];
//
//   AddtocartState(this.cartlist) : super(null);
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [cartlist];
//
// }
// class CartLoading extends CartState{
//   CartLoading({required super.cartlist});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
//
// }
//





// class decqtyState extends CartState{
//
//
//
//
//   }


//class removeCartState extends CartState{}





import 'package:equatable/equatable.dart';

import '../../Data/Model/ResponseModel.dart';



abstract class ProductState extends Equatable{

}

class ProductLoading extends ProductState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ProductLoadedState extends ProductState{
  List<Product> products;

  ProductLoadedState(this.products);

  @override
  // TODO: implement props
  List<Object?> get props => [products];


}

class ProductErrorState extends ProductState {
  String error;
  ProductErrorState(this.error);
  @override
  List<Object?> get props => [error];
}





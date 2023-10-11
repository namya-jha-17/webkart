



import 'package:equatable/equatable.dart';

import '../../Data/Model/ResponseModel.dart';

abstract class Cartevent extends Equatable{
 Cartevent();
 List<Object> get props =>[];

}
class InCqty extends Cartevent{


 int qty;
  InCqty(this.qty);
  List<Object> get props=>[qty];


}

class addToCartevent extends Cartevent{
Product product;
addToCartevent(this.product);

@override
List<Object> get Props=>[product];
}

class RemovefromCartevent extends Cartevent
{
  Product product;
  @override
  List<Object> get props=>[product];
  RemovefromCartevent(this.product);

}

import 'package:equatable/equatable.dart';

abstract class CategoryState extends Equatable{

}

class CategoryLoading extends CategoryState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class CategoryLoadedState extends CategoryState{
  List<String> categories;

  CategoryLoadedState(this.categories);

  @override
  // TODO: implement props
  List<Object?> get props => [categories];


}

class CategoryErrorState extends CategoryState {
  String error;
  CategoryErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

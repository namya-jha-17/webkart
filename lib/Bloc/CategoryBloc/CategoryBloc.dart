import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webkart/Bloc/CategoryBloc/CategoryState.dart';
import 'package:webkart/Bloc/CategoryBloc/Categoryevent.dart';

import '../../Data/ApiServices/ProductApi/ApiServices.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{
  CategoryBloc():super(CategoryLoading()) {
    on<LoadCategoryEvent>((event, emit) async {
      emit(CategoryLoading());
      ApiClient apiClient = ApiClient(Dio());
      try {
        final categorylist = await apiClient.getCategory();
        print(categorylist.toString());
        emit(CategoryLoadedState(categorylist));
      } catch (err) {
        print(err);
      }
    });
  }

}
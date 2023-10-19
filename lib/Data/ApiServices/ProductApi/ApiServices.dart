


import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../Model/ResponseModel.dart';
import '../../Model/category.dart';
part 'ApiServices.g.dart';

// class Apis {
//   static const String product = '/products';
// }

@RestApi(baseUrl:'https://dummyjson.com')
abstract class ApiClient {
  factory ApiClient(Dio dio,{String baseUrl}) = _ApiClient;

  @GET('/products/category')
  Future<List<String>> getCategory();

  @GET('/products')
  Future<Welcome3> getProduct();
  // Future<List<Product>> getProduct();


}
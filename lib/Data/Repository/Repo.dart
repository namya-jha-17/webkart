

import '../Model/ResponseModel.dart';

class Repo {
  int qty = 0;

  List<Product> cartlist = [];
  List<Product> get _cartList => cartlist;

  List<Product> AddtoCart(Product product) {
    (cartlist.any((element) => element.id == product.id))
        ? incqty(product)
        : cartlist.add(Product(
        product.quantity,
            id: product.id,
            title: product.title,
            description: product.description,
            price: product.price,
            discountPercentage: product.discountPercentage,
            rating: product.rating,
            stock: product.stock,
            brand: product.brand,
            category: product.category,
            thumbnail: product.thumbnail,
            images: product.images,
         //quantity: product.quantity
    ));

    print(cartlist.toString());
    return _cartList;
  }

  decqty(Product product) {
    product.quantity--;
    return product.quantity;
  }

  incqty(Product product) {
    product.quantity++;
    return product.quantity;
  }
Total(List<Product> cartlist){
num total=0;
    for(int i=0;i<=cartlist.length-1;i++)
        total= cartlist[i].price+total;

    return total;
}

}

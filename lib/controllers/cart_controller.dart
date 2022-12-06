import 'package:get/get.dart';
import 'package:getx_demo/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalprice => cartItems.fold(0, (sum, item) => sum + item.price);
  var testAmount = 0.0;

  addTocart(Product product) {
    cartItems.add(product);
    testAmount = totalprice;
    update();
  }
}

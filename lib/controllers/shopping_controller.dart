import 'package:get/get.dart';
import 'package:getx_demo/models/product_model.dart';

class ShoppinngController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(1, 'first', 'abd', 'some descreption about product', 30),
      Product(2, 'second', 'abd', 'some descreption about product', 40),
      Product(3, 'third', 'abd', 'some descreption about product', 42.5),
    ];
    products.value = productResult;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controllers/cart_controller.dart';
import 'package:getx_demo/controllers/shopping_controller.dart';

class HomepageSacreen extends StatelessWidget {
  final shoppingcontroller = Get.put(ShoppinngController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppinngController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}')
                                  ],
                                ),
                                Text(
                                  '${controller.products[index].price}',
                                  style: TextStyle(fontSize: 24),
                                )
                              ],
                            ),
                            ElevatedButton(
                                onPressed: (() {
                                  cartController
                                      .addTocart(controller.products[index]);
                                }),
                                child: Text('Add to cart')),
                            Obx(() => IconButton(
                                  icon: controller
                                          .products[index].isFavorite.value
                                      ? Icon(Icons.check_box_rounded)
                                      : Icon(Icons
                                          .check_box_outline_blank_outlined),
                                  onPressed: () {
                                    controller.products[index].isFavorite
                                        .toggle();
                                  },
                                ))
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
            // GetBuilder<CartController>(
            //   builder: (contorller) {
            //     return Text(
            //       'Total amount: ${contorller.testAmount}',
            //       style: TextStyle(fontSize: 32, color: Colors.white),
            //     );
            //   },
            // ),
            // GetX<CartController>(builder: (controller) {
            //   return Text(
            //     'Total amount: ${controller.totalprice}',
            //     style: TextStyle(fontSize: 32, color: Colors.white),
            //   );
            // }),
            Obx(() {
              return Text(
                'Total amount: ${cartController.totalprice}',
                style: TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            SizedBox(height: 100)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(fontSize: 24, color: Colors.black),
          );
        }),
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
      ),
    );
  }
}

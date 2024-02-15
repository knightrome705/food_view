import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled8/controller/detailedview.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller1 = Get.put(IndividualViewController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Items",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
            () => ListView.builder(
          itemCount: controller1.item.length,
          itemBuilder: (context, index) {
            final item = controller1.item[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.strMealThumb),
              ),
              title: Text(item.strMeal),
              subtitle: Text(item.strMealThumb),
            );
          },
        ),
      ),
    );
  }
}

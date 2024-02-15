

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled8/controller/foodView.dart';

import 'details.dart';

class FoodView extends StatelessWidget {
  const FoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FoodViewController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Food View",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.fooditem.length,
        itemBuilder: (context, index) {
          final items = controller.fooditem[index];
          return ListTile(
            onTap: ()async{
             String data= items.strCategory;
             SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
             sharedPreferences.setString("value", data);
             Get.toNamed('/details');
            },
            trailing: const Icon(Icons.navigate_next_rounded),
            leading: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child: Text("${index + 1}",
                  style: const TextStyle(color: Colors.white)),
            ),
            title: Text(items.strCategory),
          );
        },
      )),
    );
  }
}

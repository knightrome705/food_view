import 'dart:convert';
import 'package:untitled8/models/category.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class FoodViewController extends GetxController{
  var fooditem=<Type>[].obs;

   getFoodCategory()async{
    Uri url=Uri.parse("http://www.themealdb.com/api/json/v1/1/categories.php");
    var response=await get(url);

      if (response.statusCode == 200){
          var data = List<Type>.from(jsonDecode(response.body)['categories']
              .map((e) => Type.fromJson(e))).toList();
          if(data!=null) {
            fooditem.value = data;
          }
    }

    }
    @override
  void onInit() {
    getFoodCategory();
    super.onInit();
  }


}
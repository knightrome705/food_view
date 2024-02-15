import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled8/models/detailed_model.dart';

class IndividualViewController extends GetxController{
  var item=<Individual>[].obs;

  getindividualCategory()async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    var category=await sharedPreferences.getString("value");
    print("sucess");
    print(category);
    Uri url=Uri.parse("http://www.themealdb.com/api/json/v1/1/filter.php?c=${category}");
    var response=await get(url);

    if (response.statusCode == 200){
      try{
        var data = List<Individual>.from(jsonDecode(response.body)['meals']
            .map((e) => Individual.fromJson(e))).toList();
        if(data!=null){
          item.value=data;
        }
      }catch(e){
        print(response.statusCode);
        Get.snackbar("error", "error");
      }
    }

  }

@override
  void onInit() {
    getindividualCategory();
    super.onInit();
  }

}
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:le_fournisseur/models/profil_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilController extends GetxController {
  //TODO: Implement ProfilController

  Rx<User> user = User().obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
  
    print("object");
    super.onInit();
  }

  @override
  void onReady() {
       getUserData();
    super.onReady();
  }

  @override
  void onClose() {}

  getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');
    if (token != null) {
      var url = Uri.parse("http://devops.egaz.shop/v1/api/user/profile");
      http.Response response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });

      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        print("@@@@@@@@@@@@@@@@@@@");
        print(data["data"]);

        user.value = User.fromJson(data["data"]["user"]);
        isLoading = false.obs;

        return user;
      } else {
        print('errormsg : ${data["message"]}');
      }
    }
  }

 
  saveData(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }
}

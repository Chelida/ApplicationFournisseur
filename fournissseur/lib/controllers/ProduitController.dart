
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:le_fournisseur/models/produitModel.dart';


import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

 class ProductlistController extends GetxController{

  RxBool isLoading = false.obs;
 RxList<Produit> produit = <Produit>[].obs;
  RxBool isProblem = false.obs;

     @override
  void onInit() {
 
    super.onInit();
  }

  @override
  void onReady() {
       print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
     getProductList();
    print("object");
    super.onReady();
  }

  @override
  void onClose() {}



//recuperation la liste des produits

  getProductList() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');
  
    isLoading(true);

    
       var myUrl = Uri.parse("http://devops.egaz.shop/v1/api/products");
    http.Response response = await http.get(myUrl, headers: {
      'Accept': 'application/json',
      'Authorization' : 'Bearer $token'
    });
    var data = json.decode(response.body);

      if (response.statusCode == 200) {
     
          print("Premier visuel=========>");
         produit((data["data"]["produits"] as List)
          .map((data) => new Produit.fromJson(data))
          .toList());
          print("deuxième visuel=========> ");
          print(response.body);
          isLoading(false);
      
    
      }
      
      
       else {
        isLoading(false);
        print("Non non");
      }
    }
  }





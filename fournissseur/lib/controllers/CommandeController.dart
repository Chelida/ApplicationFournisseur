import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:le_fournisseur/models/Commande.dart';
import 'package:le_fournisseur/models/Livraison.dart';

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CommanderController extends GetxController {
  var message = RxString("");
  var token;
  var totalcredit=RxInt(0);
  var totaldebit=RxInt(0);
  var status = RxInt(0);
  var isLoading = false.obs;
  RxList<Commande> commande = <Commande>[].obs;
  RxList<LivraisonElement> livraison = <LivraisonElement>[].obs;

  @override
  void onInit() {
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    getCommande();
     getLivraison();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  int nbcommandeitems = 0;

 getCommande() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.get('token');
    isLoading(true);

    var myUrl = Uri.parse("http://devops.egaz.shop/v1/api/orders");
    http.Response response = await http.get(myUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    print(response.statusCode);
    print("Le bonjour");
    print(response.body);
    status(response.statusCode);
    var data = json.decode(response.body);
    status(response.statusCode);
    if (response.statusCode == 200) {
       commande((data["data"]["commandes"] as List)
           .map((data) => new Commande.fromJson(data))
           .toList());

      isLoading(false);
    } else {
      isLoading(false);
      throw Exception('Veuillez verifier votre connexion internet');
    }
       isLoading(false);
  }
  //enregistrer une commande

  storeCommande(int entrepot_id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    isLoading(true);

    var myUrl = Uri.parse("http://devops.egaz.shop/v1/api/orders/store");
    http.Response response = await http.post(
      myUrl,
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );
    var data = json.decode(response.body);
    print(response.statusCode);
    print("Le bonjour");
    print(response.body);
    status(response.statusCode);
    print(data);
    if (response.statusCode == 200) {
       message(data["message"]);
       getCommande();
       isLoading(false);
    } else {
       isLoading(false);
      throw Exception('Veuillez verifier votre connexion internet');
    }
  }



 getLivraison() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.get('token');
    isLoading(true);
    print("je suis ou");
    var myUrl = Uri.parse("http://devops.egaz.shop/v1/api/livraisons");
    http.Response response = await http.get(myUrl, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    print(response.statusCode);
    print("je suis la");
    print(response.body);
    status(response.statusCode);
    var data = json.decode(response.body);
    status(response.statusCode);
    if (response.statusCode == 200) {
       livraison((data["data"]["livraisons"] as List)
           .map((data) => new LivraisonElement.fromJson(data))
           .toList());

      isLoading(false);
    } else {
      isLoading(false);
      throw Exception('Veuillez verifier votre connexion internet');
    }
  
  }
  //enregistrer une commande

}

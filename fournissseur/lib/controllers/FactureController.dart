import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:le_fournisseur/models/Facture.dart';
import 'package:le_fournisseur/models/Notification.dart';
import 'package:le_fournisseur/models/Versement.dart';
import 'package:le_fournisseur/models/produitModel.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class CommandeController extends GetxController {
  String serverUrl = "http://devops.egaz.shop/v1/api";

  String message;
  var token = RxInt(0);
  var totalcredit;
  var totaldebit;
  var isLoading = false.obs;
  var status = RxInt(0);
  int nbcommandeitems = 0;
  RxList<NotificationA> notificationa = <NotificationA>[].obs;
  RxList<VersementElement> versement = <VersementElement>[].obs;


  String format(DateTime date) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate;
  }

  @override
  void onInit() {
    getnotification();
    getVersement();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  // //recuperation des commandes livree de l'utilisateur
  // Future<List> getLivraison() async{
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.get('token');
  //   List<Commande> commandes = List();

  //   String myUrl = "$serverUrl/client/commande/livree";
  //   http.Response response = await http.get(myUrl,
  //       headers: {
  //         'Accept':'application/json',
  //         'Authorization' : 'Bearer $token'
  //       });
  //   var data =  json.decode(response.body);
  //   status = response.statusCode;
  //   if (response.statusCode == 200) {
  //     commandes = (data["data"]["commandes"] as List)
  //         .map((data) => new Commande.fromJson(data))
  //         .toList();

  //     return commandes;
  //   } else {
  //     throw Exception('Veuillez verifier votre connexion internet');
  //   }

  // }

  /**
   * recuperation des notifications du client
   */
  Future<List> getFacture() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');
    List<Facture> factures = List();

    isLoading(true);
    var url = Uri.parse('$serverUrl/factures');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    status(response.statusCode);
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      factures = (data["data"]["factures"] as List)
          .map((data) => new Facture.fromJson(data))
          .toList();

      return factures;
    } else {
      isLoading(false);
      throw Exception('Veuillez verifier votre connexion internet');
    }
  }

  getnotification() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    isLoading(true);
    var url = Uri.parse('$serverUrl/user/notifications');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    status(response.statusCode);
    var data = json.decode(response.body);
    print("Bonjour bonsoir");
    print(response.statusCode);
      print(response.body);
    print("Bonjour bonsoir");
    if (response.statusCode == 200) {
      notificationa((data["data"]["notifications"] as List)
          .map((data) => new NotificationA.fromJson(data))
          .toList());

      isLoading(false);
    } else {
      print('aide');
      isLoading(false);
      throw Exception('Veuillez verifier votre connexion internet');
    }
  }

  // /**
  //  *recuperation des versements(paiement relative a la commande)
  //  */
  getVersement() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get('token');

    print('Amour');
    isLoading(true);
    var url = Uri.parse('$serverUrl/user/versements');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var data = json.decode(response.body);
    print("adaaaaaaaaaaaaaaaa");
    print(response.body);
    print("adaaaaaaaaaaaaaaaa");
    if (response.statusCode == 200) {
      versement((data["data"]["versements"] as List)
          .map((data) => new VersementElement.fromJson(data))
          .toList());
      totaldebit = data["data"]["totaldebit"];
      totalcredit = data["data"]["totalcredit"];
      print("Bonjour papa");
      print(totalcredit = data["data"]["totalcredit"]);
      isLoading(false);
    } else {
      isLoading(false);
      throw Exception('Veuillez verifier votre connexion internet');
    }
  }


}

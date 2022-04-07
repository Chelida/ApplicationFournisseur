
import 'package:flutter/material.dart';

import 'package:le_fournisseur/views/auth/log.dart';
import 'package:le_fournisseur/views/home.dart';
import 'package:le_fournisseur/views/order.dart';
import 'package:le_fournisseur/views/orders/checkout.dart';
import 'package:le_fournisseur/views/orders/listCommande.dart';
import 'package:le_fournisseur/views/orders/versements.dart';
import 'package:le_fournisseur/views/products/mesProduits.dart';
import 'package:le_fournisseur/views/profil_view.dart';
import 'package:le_fournisseur/views/screens.dart';
import 'package:le_fournisseur/views/settings/changepassword.dart';
import 'package:le_fournisseur/views/settings/profil.dart';
import 'package:le_fournisseur/views/settings/setting.dart';
import 'package:get/get.dart';
import 'views/orders/facturePage.dart';
import 'views/orders/notificationpage.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final AuthController authController = Get.put(AuthController(),permanent: true);

    return GetMaterialApp(
      title: 'Le fournisseur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Splash(),
        routes: {
       
        '/login': (context) => HomePage(),
         'Home': (context) => HomePage(),
        //'Panier': (context) => ShoppingCartPage(),
        'Commande': (context) => OrderPage(),
        'Livraison': (context) => ShippingPage(),
        'Versement': (context) => VersementPage(),
        
        'Parametre': (context) => SettingPage(),

        'Profil': (context) => ProfilView(),
        'Facture': (context) => FacturePage(),
           'produit': (context) => ProductListView(),
        'Notification': (context) => NotificationPage(),
  
        'ChangePassword': (context) => ChangePasswordPage(),
        'Checkout': (context) => ShoppingCartPage(),
        'modif': (context) => ProfilPage(),

      },
    );
  }
}


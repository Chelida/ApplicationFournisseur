import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:le_fournisseur/controllers/CartController.dart';
import 'package:le_fournisseur/controllers/ProduitController.dart';
import 'package:le_fournisseur/views/home.dart';
import 'package:le_fournisseur/views/orders/checkout.dart';
import 'package:le_fournisseur/views/orders/detailcommande.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductListView extends StatelessWidget {

  final CartController _cartController = Get.put(CartController());
  bool _isLoading = false;

  final ProductlistController _produitController =
      Get.put(ProductlistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC71617),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Liste des produits",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        actions: [],
      ),
      body: Obx(
        () => LoadingOverlay(
          child: Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            height: Get.height,
            width: Get.width,
            child: ListView.builder(
               
                itemCount: _produitController.produit.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //  Get.to(()=>DetailsProduit(),transition: Transition.fade);
                              },
                              child: (_produitController.produit[index].photo ==
                                      null)
                                  ? Image.asset(
                                      "assets/images/Logo-founisseur.png")
                                  : Container(
                                      width: Get.width / 3,
                                      height: Get.height / 9,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red,
                                        image: DecorationImage(
                                          image: NetworkImage(_produitController
                                              .produit[index].photo),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              _produitController.produit[index].libelle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Prix : ${_produitController.produit[index].prixCarton} Fcfa",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   _isLoading = true;
                                // });
                                _cartController.addProductInCart(
                                    _produitController.produit[index].id,
                                    _produitController.produit[index].status);
                                Get.to(() => ShoppingCartPage(),
                                    transition: Transition.fade);

                                print("hhhhhhhhhh");

                                print(_cartController.carts[index].produitId);
                              },
                              child: Row(children: [
                                Icon(Icons.shopping_cart_outlined,
                                    color: Color(0xff14427D), size: 16.0),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Ajouter au panier',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xff14427D),
                                        fontSize: 16))
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          isLoading: _produitController.isLoading.value,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(HomePage());
        },
        backgroundColor: Color(0xffC71617),
        child: Icon(
          Icons.dashboard,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     
    );
  }
}

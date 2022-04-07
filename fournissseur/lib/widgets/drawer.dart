import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_fournisseur/controllers/ConnexionController.dart';
import 'package:le_fournisseur/controllers/profil_controller.dart';

import 'package:loading_overlay/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DrawerPage();
  }
}

class _DrawerPage extends State<DrawerPage> {
  // AuthController databaseHelper = new AuthController();
  final ProfilController _profilController = Get.put(ProfilController());
  bool _isLoading = false;

  String email = '';
  String firstname = '';
  String lastname = '';
  String token = '';
  String adress = '';
  String telephone = '';
  String type = '';
  String photo = '';
  String code = '';
  var date = DateTime.now();

  getUserData() async {
    final prefs = await SharedPreferences.getInstance();
         
    setState(() {
      firstname = prefs.get('user_firstname').toString();
      lastname = prefs.get('user_lastname').toString();
      email = prefs.get('user_email').toString();
      photo = prefs.get('photo').toString();
      code = prefs.get('code').toString();
      telephone = prefs.get('user_telephone').toString();
      adress = prefs.get('user_adresse').toString();
      type = prefs.get('user_typeclient').toString();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
    print("============== $lastname ================");
  }

  final ConnexionController _authController = Get.put(ConnexionController());

  logout() {
    _authController.logout();
   
    Get.snackbar(
      'Deconnexion',
      "A bientôt, vous venez de vous deconnectés",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      isDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Center(
            child: Container(
                height: 250,
                child: DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, 'profilclient');
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            image: DecorationImage(
                              image: NetworkImage(photo
                                  .toString()),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      Text(
                          "$firstname $lastname",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold)),
                      Text(email,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold)),
                      Text(code,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Color(0xffc2151c),
                              fontWeight: FontWeight.bold)),
                      Text(type,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Color(0xffc2151c),
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ))),
          
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.home),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Tableau de bord",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Home');
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.file_copy),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Bon de commande',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Commande');
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.file_copy_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Enregister commande',
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Checkout');
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.file_copy),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Mes factures',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Facture');
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.file_copy_outlined),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Liste de produits',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, 'produit');
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.notifications),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, 'Notification');
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.logout),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Déconnexion',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            onTap: () {
              AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.WARNING,
                  title: 'Déconnexion',
                  desc: 'Voulez-vous vraiment vous déconnectez ?',
                  btnCancelText: 'Non',
                  btnOkText: 'Oui',
                  btnOkOnPress: () {
                    logout();
                  },
                  btnCancelOnPress: () {})
                ..show();
            },
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 100,
          ),
          ListTile(
            title: Column(
              children: [
                // Text(
                //   "Version ${_packageInfo.version}",
                //   style: TextStyle(
                //       fontSize: 12,
                //       fontFamily: 'Montserrat',
                //       color: Colors.grey[400]),
                // ),
                Text(
                  "Copyright © ${date.year} Tinitz \n Tous droits réservés",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      color: Colors.grey[400]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

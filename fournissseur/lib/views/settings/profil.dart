import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_fournisseur/controllers/ConnexionController.dart';
import 'package:le_fournisseur/controllers/profil_controller.dart';
import 'package:le_fournisseur/widgets/bottom_bar.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../profil_view.dart';
import 'setting.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool showPassword = false;

  TextEditingController _nomController = new TextEditingController();
  TextEditingController _prenomController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _adresseController = new TextEditingController();
  final ConnexionController _authController = Get.put(ConnexionController());
  final ProfilController _profilController = Get.put(ProfilController());

  String avatar;
  bool _isLoading = false;

  final profilForm = GlobalKey<FormState>();

  getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _nomController =
          new TextEditingController(text: prefs.get('user_firstname'));
      _prenomController =
          new TextEditingController(text: prefs.get('user_lastname'));
      _emailController =
          new TextEditingController(text: prefs.get('user_email'));
      _phoneController =
          new TextEditingController(text: prefs.get('user_telephone'));
      _adresseController =
          new TextEditingController(text: prefs.get('user_adresse'));
   
    });
  }


  _update() {
    if (profilForm.currentState.validate()) {
      print("oui hooooooooooaaaaaaaaa");
      setState(() {
        _isLoading = true;
      });

      _authController
          .updateProfile(
              _nomController.text,
              _prenomController.text,
              _emailController.text,
              _phoneController.text,
              _adresseController.text)
          .whenComplete(() {
        if (_authController.status == 200) {
          setState(() {
            _isLoading = false;
         
          });
         snackbar("Succes","Enregistrement effectué avec succes");
        } else {
          snackbar("Erreur","Code ou mot de passe incorrect");
      
          setState(() {
            _isLoading = false;
            print("non hoooooooooo");
            // FocusScope.of(context).requestFocus(new FocusNode());
          });
        }
      });
    } else {
     snackbar("Erreur","Aucune connexion");
      _isLoading = false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa61019),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Mon compte",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            _profilController.getUserData();
            Get.to(() => ProfilView());
          },
        ),
        actions: [
          InkWell(
              onTap: () {
                setState(() {
                  _update();
                });
              },
              child: Icon(Icons.check))
        ],
      ),
      body: LoadingOverlay(
        isLoading: _isLoading,
        opacity: 0.5,
        color: Colors.white,
        progressIndicator: CircularProgressIndicator(),
        child: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                SizedBox(
                  height: 35,
                ),
                Form(
                  key: profilForm,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: _profilController.user.value.firstname,
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffa61019),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        controller: _nomController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuillez entrer votre nom";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: _profilController.user.value.lastname,
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffa61019),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        controller: _prenomController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuillez entrer votre Prénoms ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: _profilController.user.value.email,
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffFF8400),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        controller: _emailController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuillez entrer votre email ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: _profilController.user.value.telephone,
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffFF8400),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        controller: _phoneController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuillez entrer votre Contact ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: _profilController.user.value.adresse,
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffFF8400),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                        controller: _adresseController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuillez entrer votre adresse ";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'Home');
        },
        backgroundColor: Color(0xFFa61019),
        child: Icon(Icons.dashboard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }

  Widget snackbar(String message, String type) {
    Get.snackbar(
      message,
      type,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: type == 'error' ? Colors.red : Colors.green,
      colorText: Colors.white,
      isDismissible: false,
    );
  }
}

import 'package:get/get.dart';
import 'package:le_fournisseur/controllers/ConnexionController.dart';
import 'package:le_fournisseur/widgets/widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool showPassword = false;

  TextEditingController passwordController = new TextEditingController();
  TextEditingController newpasswordController = new TextEditingController();
  TextEditingController confirmpasswordController = new TextEditingController();
  final ConnexionController _authController = Get.put(ConnexionController());
  String avatar;
  bool _isLoading = false;

  final editPasswordForm = GlobalKey<FormState>();





    _changePassword(){
    if(editPasswordForm.currentState.validate() && newpasswordController.text == confirmpasswordController.text ){
      _authController.changePassword(passwordController.text,newpasswordController.text,).whenComplete((){
        if(_authController.status.value == 200){
          Get.snackbar('Succès',
              "Mot de passe modifie avec succès",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white
          );
        }else{
          Get.snackbar('Erreur',
              "Il y a eu une erreur lors de la modification du mot de passe",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent,
              colorText: Colors.white
          );
        }
      });
    }else{
      Get.snackbar('Erreur',
          "Erreur de correspondance de mot de passe",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white
      );
    }
    editPasswordForm.currentState.reset();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Modifier votre mot de passe",
          style: TextStyle(color: Colors.white, fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon:
          Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
        backgroundColor: Color(0xffa61019),
      ),
      body: Container(
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
                   key: editPasswordForm,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Mot de passe actuel",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffa61019),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                         controller: passwordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuillez entrer votre mot de passe actuelle";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Nouveau Mot de passe",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffa61019),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                         controller: newpasswordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuillez entrer votre nouveau mot de passe ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: "Confirmer Mot de passe ",
                          labelStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                            BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xffa61019),
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                         controller: confirmpasswordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veuillez confirmer le mot de passe ";
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
                RaisedButton(
                  onPressed: _changePassword,
                  color: Color(0xffa61019),
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Enregistrer",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
   
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
        backgroundColor: Color(0xFFa61019),
        child: Icon(Icons.dashboard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );

  }

  Widget _flashMessage( String message,String type){
    return Flushbar(
      backgroundColor: type == 'error'?Colors.red:Colors.green,
      leftBarIndicatorColor: Colors.white,
      title: type== 'error'?'Erreur':'Succès',
      message: message,
      icon: type == 'error'?Icon(
        Icons.block,
        size: 28.0,
        color: Colors.white,
      ):Icon(Icons.check,color: Colors.white,),
      duration: Duration(seconds: 10),
      isDismissible: false,
    )..show(context);
  }
}


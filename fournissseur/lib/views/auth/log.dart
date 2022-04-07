import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:le_fournisseur/controllers/ConnexionController.dart';

import 'package:loading_overlay/loading_overlay.dart';

import '../home.dart';

class Log extends StatefulWidget {
  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  TextEditingController _codeController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final ConnexionController _authController = Get.put(ConnexionController());
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() => LoadingOverlay(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
                height: Get.height,
                padding: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/back.png',
                      ),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.black54, BlendMode.darken)),
                ),
                width: double.infinity,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _logo(),
                      _inputField(
                          Icon(FontAwesomeIcons.lock,
                              size: 30, color: Color(0xffA6B0BD)),
                          "Code",
                          false,
                          _codeController),
                      _inputField(
                          Icon(FontAwesomeIcons.envelope,
                              size: 30, color: Color(0xffA6B0BD)),
                          "Password",
                          true,
                          _passwordController),
                    
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xffC71617),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: []),
                        child: FlatButton(
                          onPressed: () async {
                            login();
                          },
                          padding: EdgeInsets.symmetric(vertical: 25),
                          child: Text(
                            "CONNEXION",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          isLoading: _authController.isLoading.value,
          opacity: 0.5,
          color: Colors.white,
          progressIndicator: CircularProgressIndicator(),
        ));
  }

  login() {
    if (_formKey.currentState.validate()) {
      _authController
          .login(_codeController.text, _passwordController.text.trim())
          .whenComplete(() {
            print(_authController.status.value);
        if (_authController.status.value== 200) {
         
          setState(() {
           
            _isLoading = true;
          });
       Navigator.of(context)
    .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
          print("cest bon");
        } else {
          Get.snackbar(
            'Erreur',
            "Code ou mot de passe incorrect",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white,
            isDismissible: false,
           
          );
          Get.to(Log());
           
          
        }
      });
    }
  }

  

  Widget _terms() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 18),
      child: FlatButton(
        onPressed: () => {print("Terms pressed.")},
        child: Text(
          "Terms & Conditions",
        ),
      ),
    );
  }



  Widget _inputField(
      Icon prefixIcon, String hintText, bool isPassword, textController) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText: isPassword,style: TextStyle(color: Colors.white),
        controller: textController,
        decoration: InputDecoration(
          
          contentPadding: EdgeInsets.symmetric(vertical: 25),
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.white),
          
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          
          fillColor: Colors.white24,
          filled: true,
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(
            minWidth: 75,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return "Veuillez renseigner ce champs svp";
          }
          return null;
        },
      ),
    );
  }

  Widget _logoText() {
    return Container(
        margin: EdgeInsets.only(bottom: 50),
        child: Text(
          "oxa",
        ));
  }

  Widget _logo() {
    return Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        child: Image.asset(
          'assets/images/Logo-founisseur.png',
          height: 150,
          width: double.infinity,
        ));
  }
}

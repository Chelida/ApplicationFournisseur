import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:le_fournisseur/views/profil_view.dart';

import 'package:le_fournisseur/widgets/profile_menu.dart';

import 'package:le_fournisseur/widgets/widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';



class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {


  logout(){

    Navigator.pushNamed(context, '/');
    Flushbar(
      backgroundColor: Colors.green,
      leftBarIndicatorColor: Colors.white,
      title: "Pankart",
      message: "Vous vous êtes déconnecté avec succès",
      icon: Icon(
        Icons.check,
        size: 28.0,
        color: Colors.white,
      ),
      duration: Duration(seconds: 10),
      isDismissible: false,
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa61019),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Paramètre",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            )
        ),
      ),
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            // ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
              text: "Mon compte",
              icon: "assets/icons/User Icon.svg",
              press: () => Get.to(()=>ProfilView(),transition: Transition.fade),
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              press: () => Navigator.pushNamed(context, 'Notification'),
            ),
            ProfileMenu(
              text: "Paramètre de sécurité",
              icon: "assets/icons/Settings.svg",
              press: () => Navigator.pushNamed(context, 'ChangePassword'),
            ),
            ProfileMenu(
              text: "Aide",
              icon: "assets/icons/Question mark.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "Déconnexion",
              icon: "assets/icons/Log out.svg",
              press: () {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.SCALE,
                  dialogType: DialogType.WARNING,
                  title: 'Déconnexion',
                  desc:   'Voulez-vous vraiment vous déconnectez ?',
                  btnCancelText: 'Non',
                  btnOkText: 'Oui',
                  btnOkOnPress: () {
                    logout();
                  },
                  btnCancelOnPress: (){}
                )..show();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'Home');
      },
        backgroundColor: Color(0xFFa61019),
        child: Icon(Icons.dashboard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );

  }
}

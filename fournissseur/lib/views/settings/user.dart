
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:le_fournisseur/controllers/ConnexionController.dart';





class AccountPage extends StatelessWidget {

    final ConnexionController _authController = Get.put(ConnexionController());
    bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF001e4d),
        title: Text("Mon compte",
       
        ),
      ),
      backgroundColor: Color(0xffffffff),
      body: ListView(
        padding: EdgeInsets.all(12),
        physics: BouncingScrollPhysics(),
        children: [
          Container(height:20),
          userTile(),
          divider(),
          colorTiles(),
        ],
      ),
    );
  }

  Widget bwTile(IconData icon,String text){
    return colorTile(icon, Colors.black,text,blackAndWhite: true);
  }



  Widget colorTile(IconData icon,Color color,String text,{bool blackAndWhite =false}){
    Color pickedColor = Color(0xfff3f4fe);
    return ListTile(
      leading: Container(
        child: Icon(icon,color: color),
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          color: blackAndWhite? pickedColor : color.withOpacity(0.09),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      title: Text(text,
       
      ),
      trailing: Icon(Icons.arrow_forward_ios,color:Colors.black,size:20),
    );
  }

  Widget userTile(){
    //I use pixabay.com & unsplash.com for most of the time.
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage("assets/gtci.png"),
      ),
      title: Text(
    "${_authController.user_name.value} ${ _authController.user_lastname.value}",
        
      ),
      subtitle: Text( "${_authController.code.value}",
       
      ),
    );
  }

  Widget divider(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }


  Widget colorTiles(){
    return Column(
      children: [
        InkWell(
          
            child: colorTile(Icons.person_outline,Colors.deepPurple,"Mes informations")
        ),
    
        GestureDetector(
            onTap: (){
              Get.defaultDialog(
                  title: 'Déconnexion',
                
                  middleText: 'Voulez-vous vraiment vous déconnectez ?',
                
                  onCancel: (){},
                  onConfirm: () {
                    Get.back();
                
                  },
                  textConfirm: 'Oui',
                  confirmTextColor: Colors.white,
                  textCancel: 'Non'
              );
            },
            child: colorTile(FontAwesome.adn,Colors.deepOrange,"Déconnexion")
        ),
      
      ],
    );
  }
}

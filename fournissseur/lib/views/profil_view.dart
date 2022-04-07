import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:le_fournisseur/controllers/ConnexionController.dart';
import 'package:le_fournisseur/views/settings/profil.dart';
import 'package:le_fournisseur/views/settings/setting.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../controllers/profil_controller.dart';



class ProfilView extends StatefulWidget {
  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
    final ProfilController _profilController = Get.put(ProfilController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffC71617),
          elevation: 0,
          
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(()=>ProfilPage(),transition: Transition.fade);
                },
                icon: Icon(Icons.edit)),
          ],
          leading:     IconButton(
                onPressed: () {
                  Get.to(()=>SettingPage(),transition: Transition.fade);
                },
                icon: Icon(Icons.arrow_back)),
          title: Text(
            "profil",
          ),
         
        ),
        body: Obx(
       () =>LoadingOverlay (
        
       child:
       
       SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      ListTile(
                        leading: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            // image: DecorationImage(
                            //   image:  NetworkImage(
                            //       _profilController.user.value.photo.toString()),
                            //   fit: BoxFit.cover,
                            // ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        title: Text(
                          "${_profilController.user.value.firstname} ${_profilController.user.value.lastname}",
                          style: TextStyle(
                              fontSize: 20, color: Color(0xFFFF0c1979)),
                        ),
                        subtitle: Text("${_profilController.user.value.telephone}"),
                      ),
                    ],
                  ),
           Padding(
             padding: const EdgeInsets.only(left: 20,right: 20),
             child: Divider(),
           ),
                  Column(
                    children: [
                      ListTile(
                        title: Text("Code client"),
                        subtitle: Text("${_profilController.user.value.code}"),
                      ),
                      ListTile(
                        title: Text("Type"),
                        subtitle: Text("Entreprise"),
                      ),
                      ListTile(
                        title: Text("Contact"),
                        subtitle: Text("${_profilController.user.value.email}"),
                      ),
                      ListTile(
                        title: Text("Pays"),
                        subtitle: Text("Côte d'Ivoire"),
                      ),
                      ListTile(
                        title: Text("Adresse"),
                        subtitle: Text("${_profilController.user.value.adresse}"),
                      ),
                
                    ],
                  ),
                ],
              ),
            ),
          ),
          isLoading: _profilController.isLoading.value,
        opacity: 1,
        color: Colors.white,
        progressIndicator: CircularProgressIndicator(),
      
             ),
        ));
  
  }
}

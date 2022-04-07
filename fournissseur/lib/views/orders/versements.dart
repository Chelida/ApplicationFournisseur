
import 'dart:convert';

import 'package:get/get.dart';
import 'package:le_fournisseur/controllers/CommandeController.dart';
import 'package:le_fournisseur/controllers/FactureController.dart';
import 'package:le_fournisseur/models/Versement.dart';
import 'package:le_fournisseur/views/orders/detailcommande.dart';
import 'package:le_fournisseur/widgets/widgets.dart';
import 'package:le_fournisseur/models/Commande.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VersementPage extends StatelessWidget {


    final CommandeController _commandeController = Get.put(CommandeController());


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text(
          "Mon relevé",
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 16.0,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffC71617),
      ),
      drawer: DrawerPage(),
      body: Obx(() => LoadingOverlay(
           
    
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(blurRadius: 2.0, color: Colors.grey)
                        ]),
                    child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Total débit ',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                '${_commandeController.totaldebit} FCFA',
                                style: TextStyle(
                                    color: Color(0xfff68a1f),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Total crédit',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.0),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                ' ${_commandeController.totalcredit} FCFA',
                                style: TextStyle(
                                    color: Color(0xfff68a1f),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Expanded(
                  child: _commandeController.versement.length != 0?
           ListView.builder(
 
          itemCount:  _commandeController.versement.length ,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Type :${_commandeController.versement[index].numero}',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Montserrat',),
                                    textAlign: TextAlign.left,
                                  ),
                                  Row(
                                    children: [
                                      Text(' ${_commandeController.versement[index].moyen}',style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '${_commandeController.versement[index].description}',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Montserrat',color: Color(0xff14427D)),
                                  ),Text(
                                    '${_commandeController.versement[index].type}',
                                    style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Montserrat',color: Color(0xff14427D)),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          children: [
                                       if(_commandeController.versement[index].type == 'retrait')
                                              Text(
                                                'Débit : ${_commandeController.versement[index].montant}',
                                                style: TextStyle(fontFamily: 'Montserrat',),
                                                textAlign: TextAlign.right,
                                              )
                                            else
                                          
                                            Text(
                                              'Solde : ${_commandeController.versement[index].solde} FCFA',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(fontFamily: 'Montserrat',),
                                            ),
                                          ],
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
      
                      Text('effctuée par ${_commandeController.versement[index].createdBy} le ${_commandeController.versement[index].dateTransaction.toString().replaceAll("T", " ").substring(0, 19)}',style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            );
          }):Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Vous n'avez pas effectué de transaction ",
                  style:TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      color: Colors.grey,
                      fontWeight: FontWeight.bold
                  )
      
              ),
              Padding(padding: EdgeInsets.all(2)),
            ],
          )
          ),
              ),
            ],
          ),
        ),
           isLoading: _commandeController.isLoading.value,
      ),
     ),
      );

  }


 



}



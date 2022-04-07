
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:le_fournisseur/controllers/FactureController.dart';
import 'package:le_fournisseur/models/Facture.dart';
import 'package:le_fournisseur/widgets/bottom_bar.dart';
import 'package:le_fournisseur/widgets/drawer.dart';
import 'package:intl/intl.dart';


class FacturePage extends StatelessWidget {


  final CommandeController _commandeController = Get.put(CommandeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa61019),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Mes Factures",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            )
        ),
      ),
      drawer: DrawerPage(),
      body: _facture(),
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

  _facture() {
    return FutureBuilder<List>(
      
      future: _commandeController.getFacture(),
      builder: (context ,snapshot){
        if(snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? new FactureItem(factures: snapshot.data,)
            : new Center(child: new CircularProgressIndicator(),);
      },
    );
  }

}

class FactureItem extends StatelessWidget {

  List<Facture> factures;
  FactureItem({this.factures});

    String format(DateTime date) {
   String formattedDate = DateFormat('dd/MM/yyyy').format(date);
   return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      //shrinkWrap: true,
      physics: BouncingScrollPhysics(),
        itemCount:  factures.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(18.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 30.0,
                height: Get.height/6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                factures[index].reference,
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              subtitle: Text(
                                factures[index].reference,
                                style: TextStyle(fontFamily: 'Montserrat',color: Colors.grey, fontSize: 12.0),
                              ),
                              trailing: factures[index].statut==1?
                              Container(
                                width: 80.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.green),
                                child: Center(
                                  child: Text(
                                    'Payee',
                                    style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                                  ),
                                ),
                              ):
                              Container(
                                width: 80.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.red),
                                child: Center(
                                  child: Text(
                                    'Impayee',
                                    style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    format(factures[index].createdAt),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "Avance : ${factures[index].avance} FCFA",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.grey,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        "Reste : ${factures[index].reste} FCFA",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.grey,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        "Total : ${factures[index].montantttc} FCFA",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold),
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 5.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: factures[index].statut==1?Colors.green:Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

}

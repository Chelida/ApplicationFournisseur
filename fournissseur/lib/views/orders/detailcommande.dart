
import 'package:get/get.dart';
import 'package:le_fournisseur/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:le_fournisseur/controllers/CommandeController.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DetailsProduit extends StatelessWidget {

  final CommanderController _commanderController =
      Get.put(CommanderController());
  bool load = false;

  @override
 

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffC71617),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Details Produit: widget.commande.reference",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
            )
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Ref : widget.commande.reference",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w600
                                      )
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Expanded(child: Column(
                                  children: <Widget>[
                                    Text("Total achat :",style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600
                                    ),
                                    ),
                                    Text("widget.commande.montantttc FCFA",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFF8400),),
                                    )
                                  ],
                                ),),
                                Expanded(child: Column(
                                  children: <Widget>[
                                   
                                    Container(
                                      width: 80.0,
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: Colors.green),
                                      child: Center(
                                        child: Text(
                                          'Payée',
                                          style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                                        ),
                                      ),
                                    ),
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
                                    SizedBox(height: 10,),
                                    // if(widget.commande.statut==1)
                                      Container(
                                        width: 80.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: Colors.green),
                                        child: Center(
                                          child: Text(
                                            'livrée',
                                            style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                                          ),
                                        ),
                                      ),
                                    // if(widget.commande.statut==2)
                                      Container(
                                        width: 80.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: Colors.orange),
                                        child: Center(
                                          child: Text(
                                            'encours',
                                            style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                                          ),
                                        ),
                                      ),
                                    // if(widget.commande.statut==0)
                                      Container(
                                        width: 80.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color: Colors.grey),
                                        child: Center(
                                          child: Text(
                                            'en attente ',
                                            style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                                          ),
                                        ),
                                      ),
                                    // if(widget.commande.statut==3)
                                      Container(
                                        width: 80.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            color:Color(0xffC71617)),
                                        child: Center(
                                          child: Text(
                                            'refusée',
                                            style: TextStyle(fontFamily: 'Montserrat',color: Colors.white, fontSize: 12.0),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    color: Colors.white,
                    child: ListTile(title: Text("Articles commandés ",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600
                      )
                    ),),
                  ),
                  Container(child: Divider(),color: Colors.white,),
                  load==true?Container(
                      color: Colors.white,
                      child: Center(
                        child: CircularProgressIndicator()
                      )
                  ):Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child:  FutureBuilder<List>(
                      // future: commandeController.getCommandeItems(widget.commande.id),
                      builder: (context ,snapshot){
                        if(snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ? new Commandeitems()
                            : new Center(child: new CircularProgressIndicator(),);
                      },
                    ),

                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(title: Text("Détails de la commande",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        ),
                     
                        Divider(),
                        ListTile(
                          title: Text("Date de la commande",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("widget.commande.date_commande.toString().replaceAll.substring(0, 19)",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600
                                ),)
                            ],
                          ),
                          leading: Icon(Feather.calendar),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),

                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.pushNamed(context, 'Home');
      },
        backgroundColor: Color(0xffC71617),
        child: Icon(Icons.dashboard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }

}

class Commandeitems extends StatelessWidget {

  // List<CommandeItems> commandeitems = List();
  // Commandeitems({this.commandeitems});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      height: 300,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount:28,
        itemBuilder: (BuildContext context, int index) {
          return  Column(
            children: [
              ListTile(
                title: Text('commandeitems[index].produit_name',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600
                  ),),
                subtitle: Column(
                  children: [
                    Text("commandeitems[index].quantite.toString()commandeitems[index].montant.toString()",style: TextStyle(
                        fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w400)),
                    /*
                    Text("${commandeitems[index].total} FCFA",style: TextStyle(
                        fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w400)),*/
                    Text("commandeitems[index].type ",style: TextStyle(
                        fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.w400)),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                leading: Container(
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/logo.png'),
                    image: NetworkImage('assets/images/bg.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Divider(),
            ],
          );

        },
      ),

    );Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Vous avez  aucune commande encours',
                style:TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                )

            ),
            Padding(padding: EdgeInsets.all(2)),
          ],
        )
    );
  }

}

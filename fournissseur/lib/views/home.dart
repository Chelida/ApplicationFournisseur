import 'package:get/get.dart';
import 'package:le_fournisseur/controllers/ConnexionController.dart';
import 'package:le_fournisseur/controllers/FactureController.dart';
import 'package:le_fournisseur/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {


 final ConnexionController _authController = Get.put(ConnexionController());


  String avatar;
   String solde;
  getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      avatar = prefs.get('userAvatar');
      

    });
  }

  @override
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Image.asset(
          'assets/images/Logo-founisseur.png',
          width: 100,
          height: 100,
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Color(0xffc2151c),
      ),
      drawer: DrawerPage(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'Parametre');
                  },
                  child: CircleAvatar(
                    backgroundImage: avatar != null
                        ? NetworkImage(avatar)
                        : AssetImage('assets/images/Logo-founisseur.png'),
                    radius: 22,
                    backgroundColor: Colors.white,
                  ),
                ),
                Container(
                  child: Text(
                    'Tableau de bord',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    icon: Icon(Feather.bell),
                    onPressed: () {
                      Navigator.pushNamed(context, 'Notification');
                    })
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(blurRadius: 2.0, color: Colors.grey)
                      ]),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(25.0, 25.0, 5.0, 5.0),
                            child: Text(
                              'Solde due',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(25.0, 40.0, 5.0, 25.0),
                           child:
                            // Text(
                            //   ' ${_commandeController.totaldebit} FCFA',
                            //   style: TextStyle(
                            //       color: Color(0xff14427D),
                            //       fontFamily: 'Montserrat',
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 18.0),
                            // )
                             Text(
                               
                                '${_authController.solde.toString()} FCFA',
                                style: TextStyle(
                                    color: Color(0xfff68a1f),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              )
                          ),
                            
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () async {
                             Navigator.pushNamed(context, 'produit');
                         
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 8),
                            height: 60.0,
                            decoration: BoxDecoration(
                                color: Colors.grey[400].withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                              child: Text('Passer une commande',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffa61019))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 40.0),
            GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 4.0,
              shrinkWrap: true,
              children: <Widget>[
                _buildCard(
                    'Mes Commandes' '',
                    'Tom',
                    'Consulter vos bons de commande',
                    'assets/images/order.png',
                    'Commande'),
                _buildCard('Mes Factures', 'Tom', 'Mes factures',
                    'assets/images/billing.png', 'Facture'),
                _buildCard(
                    'Mes livraisons',
                    'Tom',
                    'Consulter vos bons de livraison',
                    'assets/images/shipping.png',
                    'Livraison'),
                _buildCard('Mon relevé ', 'Tom', 'Historique des transactions',
                    'assets/images/invoice.png', 'Versement'),
              ],
            )
          ],
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

  Widget _buildCard(
      String title, String name, String description, String image, String url) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, url);
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 5.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                image,
                fit: BoxFit.cover,
                height: 90,
              ),
              SizedBox(height: 8.0),
              Text(
                '',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                description,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                    color: Colors.grey),
              ),
              SizedBox(height: 15.0),
              Expanded(
                  child: Container(
                      width: 175.0,
                      decoration: BoxDecoration(
                        color: Color(0xffa61019),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                      child: Center(
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: 'Montserrat'),
                        ),
                      )))
            ],
          ),
          margin: EdgeInsets.fromLTRB(10.0, 0.0, 25.0, 10.0)),
    );
  }
}

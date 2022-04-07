import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6.0,
        color: Colors.transparent,
        elevation: 9.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0)
                ),
                color: Colors.white
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width /2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                              icon:  Icon(Feather.truck, color: Color(0xFF676E79)),
                              onPressed: (){
                                Navigator.pushNamed(context, 'Commande');
                              },

                          ),
                          IconButton(
                            icon: Icon(Feather.file_text, color: Color(0xFF676E79)),
                            onPressed: (){
                                Navigator.pushNamed(context, 'Facture');
                            },
                          )
                        ],
                      )
                  ),
                  Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width /2 - 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Feather.shopping_cart, color: Color(0xFF676E79)),
                            onPressed: (){
                              Navigator.pushNamed(context, 'Checkout');
                            },
                          ),
                          IconButton(
                            icon: Icon(Feather.user, color: Color(0xFF676E79)),
                            onPressed: (){
                              Navigator.pushNamed(context, 'Parametre');
                            },
                          ),
                        ],
                      )
                  ),
                ]
            )
        )
    );
  }
}
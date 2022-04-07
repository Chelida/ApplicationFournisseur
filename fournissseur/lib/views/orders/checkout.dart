





import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:le_fournisseur/controllers/CartController.dart';
import 'package:le_fournisseur/controllers/CommandeController.dart';

import 'package:le_fournisseur/models/Cart.dart';
import 'package:le_fournisseur/views/order.dart';
import 'package:le_fournisseur/widgets/bottom_bar.dart';
import 'package:loading_overlay/loading_overlay.dart';



class ShoppingCartPage extends StatefulWidget {


  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  int shoppingCartCount = 1;
  List<Cart> carts = List();

    CartController _cartController = Get.put(CartController());
  CommanderController _commandeController = Get.put(CommanderController());

  bool _isLoading = false;
  int entrepotId =0;


  getCart() async{
    _cartController.getCart().whenComplete(() =>
        setState((){
          carts = _cartController.carts;
        })

    );
    print(carts);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCart();
  }

  updateProductInCart(int cart_id,int quantite,int produit_id){
    setState((){
      _isLoading = true;
    });
    _cartController.updateProductInCart(cart_id,quantite, produit_id).whenComplete((){
      if(_cartController.status == 200){
        _cartController.getCart().whenComplete(() =>
            setState((){
              _isLoading = false;
            })
        );
      }else{
        setState((){
          _isLoading = false;
        });
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      child: Scaffold(
        appBar:AppBar(
          title: Text(
            "Votre panier",
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 16.0,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Color(0xffc2151c),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: _cart(),
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
      ),
      isLoading: _isLoading,
      opacity: 0.5,
      color: Colors.white,
      progressIndicator: CircularProgressIndicator(),
    );
  }

    Widget snackbar(String message, String type) {
    Get.snackbar(
      message,
      type,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: type == 'error' ? Colors.red : Colors.green,
      colorText: Colors.white,
      isDismissible: false,
    );
  }



  _cart() {
    return FutureBuilder<List>(
      future: _cartController.getCart(),
      builder: (context ,snapshot){
        if(snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? shoppingCartItem(snapshot.data)
            : Center(child: CircularProgressIndicator(),);
      },
    );
  }

  shoppingCartItem(List<Cart> carts) {

    return carts.length>0 ? Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 3/5,
          child: ListView.builder(
              itemCount: carts.length,
              itemBuilder: (context,i){
                return Container(
                  padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  height: 200,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: (MediaQuery.of(context).size.width) / 3,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  height:100,
                                  child: Image.network(carts[i].produitPhoto,
                                    fit: BoxFit.cover,)
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(Icons.remove_circle_outline),
                                      onPressed: () {
                                        int qte = carts[i].quantite - 1;
                                        setState(() {
                                          if(carts[i].quantite >=2)
                                            updateProductInCart(carts[i].id,qte, carts[i].produitId);
                                        });
                                      },
                                    ),
                                    Text(
                                      '${carts[i].quantite}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add_circle_outline),
                                      onPressed: () {
                                        int qte = carts[i].quantite+1;
                                        updateProductInCart(carts[i].id,qte, carts[i].produitId);
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: (MediaQuery.of(context).size.width - 37) / 1.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 12.0),
                                    width: 150,
                                    child: Text(
                                      carts[i].produitName,
                                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 14.0,fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Feather.trash_2,color: Colors.red,),
                                    onPressed: () {
                                      AwesomeDialog(
                                          context: context,
                                          animType: AnimType.BOTTOMSLIDE,
                                          dialogType: DialogType.WARNING,
                                          body: Center(child: Text(
                                            'Voulez-vous vraiment retiré ${carts[i].produitName} de votre panier ?',
                                            style: TextStyle(fontSize: 12,fontFamily: 'Montserrat',fontWeight: FontWeight.bold),
                                          ),),
                                          title: 'Panier',
                                          btnOkOnPress: (){
                                            setState(() {
                                              _isLoading = true;
                                            });
                                            _cartController.deleteProductInCart(carts[i].produitId).whenComplete((){
                                              if(_cartController.status == 200){
                                                setState(() {
                                                  _isLoading = false;
                                                });
                                                Navigator.of(context).push(new MaterialPageRoute(
                                                  builder: (BuildContext context) => ShoppingCartPage(),
                                                ));
                                                snackbar(_cartController.message, "success");
                                              
                                              }else{
                                                setState(() {
                                                  _isLoading = false;
                                                });
                                                snackbar(_cartController.message, 'error');
                                             
                                              }
                                            });
                                          },
                                          btnCancelOnPress: (){},
                                          btnCancelText: 'Non',
                                          btnOkText: 'Oui'
                                      )..show();
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        "${carts[i].total} FCFA",
                                        style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.bold,fontFamily: 'Montserrat',),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
    
        Container(
          padding: EdgeInsets.only(top: 18.0, left: 8.0, right: 8.0),
          height: 75,
          child: Card(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Total",
                        style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Montserrat',),
                      ),
                      Text("${_cartController.montantttc} FCFA",
                        style: TextStyle(fontFamily: 'Montserrat',),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: 8.0, left: 8.0, right: 8.0, bottom: 16.0),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
            color: Color(0xffc2151c),
            onPressed: () async{
              setState(() {
                _isLoading = true;
              });
              _commandeController.storeCommande(entrepotId).whenComplete((){
                if(_commandeController.status == 200){
                  setState(() {
                    _isLoading = false;
                  });
                  Get.to(()=>OrderPage(),transition:Transition.fadeIn);
                  snackbar("Enregistrer avec success",'success');
               
                }else{
                  setState(() {
                    _isLoading =false;
                  });
                  snackbar("une erreur c'est produite lors de l'enregistrement",'error');
                 
                }
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Valider",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ):Center(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
    
              Text("votre panier est vide",
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
    );

  }

}



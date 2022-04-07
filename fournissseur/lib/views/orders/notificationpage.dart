import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:le_fournisseur/controllers/FactureController.dart';
import 'package:le_fournisseur/models/Facture.dart';
import 'package:le_fournisseur/models/Notification.dart';
import 'package:le_fournisseur/widgets/bottom_bar.dart';
import 'package:le_fournisseur/widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';

class NotificationPage extends StatelessWidget {

  final CommandeController _commandeController = Get.put(CommandeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa61019),
        elevation: 0.0,
        centerTitle: true,
        title: Text("Mes notifications",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      drawer: DrawerPage(),
      body: Obx(
        () => LoadingOverlay(
          child: _commandeController.notificationa.length != 0
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _commandeController.notificationa.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _commandeController.notificationa[index].statusCode
                            .toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        _commandeController.notificationa[index].message,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      leading: SvgPicture.asset(
                        "assets/icons/Bell.svg",
                        color: Color(0xffFCC10A),
                        width: 22,
                      ),
                     
                    );
                  })
              : Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Vous n'avez pas de notification",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)),
                      Padding(padding: EdgeInsets.all(2)),
                    ],
                  ),
                ),
          isLoading: _commandeController.isLoading.value,
        ),
      ),
    );
  }
}

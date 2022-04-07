import 'package:flutter/material.dart';
import 'package:le_fournisseur/views/auth/log.dart';
import 'package:splashscreen/splashscreen.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new Log(),
   
        image:  Image.asset('assets/images/Animation.gif'),
        loadingText: Text("Chargement"),
        photoSize: 200.0,
        loaderColor: Colors.blue,
      ),
    );
    

  }
}

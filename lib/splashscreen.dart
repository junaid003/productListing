import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:product/login/loginScreen.dart';
import 'package:product/productListingScreen/productListingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
     moveNextScreen();
    super.initState();
  }
  void moveNextScreen () {
    Future.delayed(const Duration(seconds: 3), () {
if (FirebaseAuth.instance.currentUser != null) {
   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        const ProductListingScreen()), (Route<dynamic> route) => false);
} else {
Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        const LoginScreen()), (Route<dynamic> route) => false);
}
});
  }
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      home: Scaffold(
        body: Column (
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
            Image.asset('assets/images/img.png'),
            const SizedBox( height: 50,),
            const CircularProgressIndicator()
           ],
        ),
      ),
    );
  }
}
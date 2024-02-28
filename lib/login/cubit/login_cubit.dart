// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:product/core/alert/common_alert.dart';
import 'package:product/productListingScreen/productListingscreen.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  get nameController => null;
   void loginfunction(BuildContext context) async {


     if(emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty) {
      CommonAlert.showAlertDialog(context, 'Please enter email id and password');
     } else { 

  try {
   await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
  ).then((value) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        const ProductListingScreen()), (Route<dynamic> route) => false);
  });
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    CommonAlert.showAlertDialog(context, 'No user found for that email.');
  } else if (e.code == 'wrong-password') {
    CommonAlert.showAlertDialog(context, 'Wrong password provided for that user.');
  }
  else if (e.code == 'invalid-credential') {
    CommonAlert.showAlertDialog(context, 'credential is incorrect');
  }
   else   {
    CommonAlert.showAlertDialog(context, e.message??"Something went wrong");
}
  }
   }
     }
   
   }

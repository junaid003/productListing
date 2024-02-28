import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:product/core/alert/common_alert.dart';
import 'package:product/productListingScreen/productListingscreen.dart';
part 'registration_data_state.dart';

class RegistrationDataCubit extends Cubit<RegistrationDataState> {
  RegistrationDataCubit() : super(RegistrationDataInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnfpasswordController = TextEditingController();


     validation (BuildContext context){
       if( emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty || cnfpasswordController.text.trim().isEmpty) {
         CommonAlert.showAlertDialog(context, 'please enter all  fields');
         return false;
         
       } 
       else if (passwordController.text.trim().length <= 7 ){
         CommonAlert.showAlertDialog(context, 'minimum password length is 8 ');
         return false;
       }
        else if (passwordController.text.trim() != cnfpasswordController.text.trim()){
           CommonAlert.showAlertDialog(context, 'password and confirm password should be same');
         return false;
       }
       else {
        return true;
       }

    }

   Future<void> registration (BuildContext context) async {

  bool val = validation(context);
     if(val) {
   try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim()).then((value) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        const ProductListingScreen()), (Route<dynamic> route) => false);
        });

        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            CommonAlert.showAlertDialog(context, 'The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
        
           CommonAlert.showAlertDialog(context, 'The account already exists for that email.');
          }
        } catch (e) {
           CommonAlert.showAlertDialog(context, e.toString());
          print(e);
        }
 }
   }
}

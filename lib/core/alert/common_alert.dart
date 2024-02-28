

import 'package:flutter/material.dart';

class CommonAlert {
  static showAlertDialog(BuildContext context, String msg) {

    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
         Navigator.pop(context);
      },
    );

   
    AlertDialog alert = AlertDialog(
      title: const Text("Alert"),
      content: Text(msg),
      actions: [
        okButton,
      ],
    );


    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

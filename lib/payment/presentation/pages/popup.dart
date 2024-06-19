import 'package:flutter/material.dart';

class Az extends StatelessWidget {
  const Az({super.key});

  static void showAlertDialog(BuildContext context) {

    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {},
    );

    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text("hallow"),
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

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

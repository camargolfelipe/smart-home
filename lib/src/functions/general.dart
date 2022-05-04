import 'package:flutter/material.dart';

class Dialogs {
  void simple(context, String title, String desc, bool haveAction,
      {Function()? function}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(desc),
          actions: <Widget>[
            TextButton(
              child: const Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Visibility(
                child: TextButton(
                    child: const Text("Confirmar"), onPressed: function),
                visible: haveAction),
          ],
        );
      },
    );
  }
}

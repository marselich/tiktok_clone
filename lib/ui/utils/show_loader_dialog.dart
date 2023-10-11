import 'package:flutter/material.dart';

showLoaderDialog(BuildContext context) {
  AlertDialog alert = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(),
    ),
  );
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black12,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

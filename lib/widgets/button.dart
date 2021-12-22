import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget WidgetBtn(String title, Function() didTap) {
  return Container(
    margin: const EdgeInsets.all(20),
    child: ElevatedButton(
      style: ButtonStyle(

        backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const
        EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
      ),
      child: Text(title),
      onPressed: () => didTap(),
    )// widget.didTapAddButton(ButtonBV(name: name, url: url)),),
  );
}
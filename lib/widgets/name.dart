import 'package:flutter/material.dart';

Widget WidgetName(String text, Function(String) didChange) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
    child: TextFormField(
      onChanged: (value) => didChange(value),
      cursorColor: Colors.blueGrey,
      initialValue: text, //'Input text',
      maxLength: 20,
      decoration: const InputDecoration(
        // icon: Icon(
        //   Icons.create,
        //   color: Colors.blueGrey,
        // ),
        labelText: 'Label text',
        labelStyle: TextStyle(
          color: Colors.teal,
        ),
        helperText: 'Helper text',
        suffixIcon: Icon(
          Icons.create,
          color: Colors.teal,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
    ),
  );
}
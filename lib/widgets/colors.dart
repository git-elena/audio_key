import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

Widget WidgetColors(Color color, Function(Color) onChange) {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: MaterialColorPicker(
      onColorChange: (value) => onChange(value),
      selectedColor: color,
    ),
  );
}
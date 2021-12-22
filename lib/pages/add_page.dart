import 'package:audio_key/floor/dao/audio_key_dao.dart';
import 'package:audio_key/floor/entity/db_audio_key.dart';
import 'package:audio_key/widgets/button.dart';
import 'package:audio_key/widgets/colors.dart';
import 'package:audio_key/widgets/name.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  final AudioKeyDAO audioKeyDAO;

  const AddPage({Key? key,
    required this.audioKeyDAO
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: _AddPageBody(didTapButton: (btn) {
        /// todo Add New Button
        audioKeyDAO.insertButtonBV(btn);
        Navigator.of(context).pop(true);
      })
    );
  }
}

class _AddPageBody extends StatefulWidget {
  const _AddPageBody({Key? key,
    required this.didTapButton
  }) : super(key: key);

  final Function(AudioKey) didTapButton;

  @override
  _AddPageBodyState createState() => _AddPageBodyState();
}

class _AddPageBodyState extends State<_AddPageBody> {

  String name = "new Audio";
  int color   = Colors.teal.value;

  void _didTapColor(Color color) {
    this.color = color.value;
  }

  void _setName(String name) {
    this.name = name;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              /// todo Название
              WidgetName('new Audio Key', (value)=> _setName(value)),

              /// todo Color Picker
              WidgetColors(Colors.blueGrey, (color) => _didTapColor(color)),

            ],
          ),
        ),

        /// todo Button
        WidgetBtn('Add', () => widget.didTapButton(AudioKey(name: name, color: color, filePath: ''))),

      ],
    );
  }
}

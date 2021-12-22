import 'package:audio_key/floor/dao/audio_key_dao.dart';
import 'package:audio_key/floor/entity/db_audio_key.dart';
import 'package:audio_key/widgets/button.dart';
import 'package:audio_key/widgets/colors.dart';
import 'package:audio_key/widgets/name.dart';
import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  final AudioKeyDAO audioKeyDAO;
  final AudioKey audioKey;

  const EditPage({Key? key,
    required this.audioKeyDAO,
    required this.audioKey
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit'),
          actions: [
            GestureDetector(
                onTap: () {audioKeyDAO.deleteButtonById(audioKey.buttonId!);
                Navigator.of(context).pop(true);
                },
                child: const Center(child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text('Delete'),
                )))
          ],
        ),
        body: _EditPageBody(audioKey: audioKey,  didTapButton: (btn) {
          /// todo Edit Button
          audioKeyDAO.updateButtonBV(btn);
          Navigator.of(context).pop(true);
        })
    );
  }
}

class _EditPageBody extends StatefulWidget {
  const _EditPageBody({Key? key,
    required this.audioKey,
    required this.didTapButton
  }) : super(key: key);

  final AudioKey audioKey;
  final Function(AudioKey) didTapButton;

  @override
  _EditPageBodyState createState() => _EditPageBodyState();
}

class _EditPageBodyState extends State<_EditPageBody> {

  late String name;
  late int color;

  void _didTapColor(Color color) {
    this.color = color.value;
  }

  void _setName(String name) {
    this.name = name;
  }


  void _didTapButton() {
    widget.didTapButton(AudioKey(buttonId: widget.audioKey.buttonId, name: name, color: color, filePath: ''));
  }

  @override
  void initState() {
    name  = widget.audioKey.name;
    color = widget.audioKey.color;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              /// todo Название
              WidgetName(name, (value)=> _setName(value)),

              /// todo Color Picker
              WidgetColors(Color(color), (color) => _didTapColor(color)),

            ],
          ),
        ),

        /// todo Button
        WidgetBtn('Done', () => _didTapButton()),

      ],
    );
  }
}

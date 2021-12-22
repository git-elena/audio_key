import 'package:audio_key/floor/dao/audio_key_dao.dart';
import 'package:audio_key/floor/entity/db_audio_key.dart';
import 'package:audio_key/pages/add_page.dart';
import 'package:audio_key/pages/edit_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  final AudioKeyDAO audioKeyDAO;

  const HomePage({Key? key,
    required this.audioKeyDAO
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<AudioKey> listKey = [];

  void _updateKey() async {
    final list = await widget.audioKeyDAO.getAllItemInButton();
    listKey.clear();
    listKey.addAll(list);
    setState(() {});
  }

  @override
  void initState() {
    _updateKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Key'),),
        body: _getListAudioKey());
  }

  Widget _getListAudioKey() {

    void _didLongPress(int index) async {
      if (index >= listKey.length) {
        return;
      } else {
        final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                EditPage(audioKey: listKey[index], audioKeyDAO: widget.audioKeyDAO,)
            )
        );
        if (result != null && result) {
          _updateKey();
        }
      }
    }

    void _didTap(int index) async {
      if (index == listKey.length) {
        final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                AddPage(audioKeyDAO: widget.audioKeyDAO,)
            )
        );
        if (result != null && result) {
          _updateKey();
        }
      } else {


      }
    }


    return ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => _didTap(index),
          onLongPress: () => _didLongPress(index),
          child: index == listKey.length
              ? Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(.2),
              borderRadius: const BorderRadius.all(Radius.circular(13))
            ),
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            child: const Center(child: Icon(
                Icons.add,
              color: Colors.teal,
            ),),)
              : ItemAudioKey(
              color: listKey[index].color,
              name: listKey[index].name),
        ),
        separatorBuilder: (context, index) => Container(
          height: 1,
          color: Colors.blueGrey.withOpacity(.5),
        ),
        itemCount: listKey.length + 1
    );
  }
}



class ItemAudioKey extends StatelessWidget {
  final String name;
  final int color;

  const ItemAudioKey({Key? key,
    required this.color,
    required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        decoration: BoxDecoration(
          color: Color(color),
          borderRadius: const BorderRadius.all(Radius.circular(13))
        ),
        margin: const EdgeInsets.all(8),
        height: size,
        width: size,

      ),
      Center(child: Text(name),)
    ],);
  }

  static const double size = 70;
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app_hive/widget/routes.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {


  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> _items = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final _activities = Hive.box('activities');
  void _refreshNote() {
    final data = _activities.keys.map((key) {
      final item = _activities.get(key);
      return {'key': key, 'title': item['title'], 'note': item['note']};
    }).toList();
    setState(() {
      _items = data.reversed.toList();
      print('This is to test ${_items.length}');
      print('check ${_items[0]['note']}');
    });
  }

  Future<void> _createNote(Map<String, dynamic> newNote) async {
    await _activities.add(newNote);

    _refreshNote();
  }

  @override
  Widget build(BuildContext context, dynamic indexKey) {
    if (indexKey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == indexKey);
      _titleController.text = existingItem['title'];
      _noteController.text =existingItem['note'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Activity'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 18,
              left: 18,
              right: 18),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(hintText: 'Title', filled: true),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLines: 9,
                  controller: _noteController,
                  decoration: InputDecoration(
                    hintText: 'Note',
                    filled: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () async {
                      _createNote({
                        'title': _titleController.text,
                        'note': _noteController.text,
                      });
                      print(' VALUE OF NOTE${_noteController.text}');
                      _titleController.text = '';
                      _noteController.text = '';

                      Navigator.pushNamed(context, homepageRoute);
                    },
                    child: const Text('Create Note'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

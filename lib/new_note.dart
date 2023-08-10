import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app_hive/widget/text_form.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
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
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppTextFormField(controller: _titleController, text: 'Title'),
              const SizedBox(
                height: 10,
              ),
              AppTextFormField(
                controller: _noteController,
                text: 'Note',
                maxLines: 10,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    _createNote({
                      'title': _titleController.text,
                      'note': _noteController.text
                    });
                    _titleController.text = '';
                    _noteController.text = '';
                    Navigator.of(context).pop();
                  },
                  child: const Text('Create Note'))
            ],
          ),
        ),
      ),
    );
  }
}

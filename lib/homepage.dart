import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app_hive/widget/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _items = [];
  final _activities = Hive.box('activities');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshNote();
  }

  void _refreshNote() {
    final data = _activities.keys.map((key) {
      final item = _activities.get(key);
      return {'key': key, 'title': item['title'], 'note': item['note']};
    }).toList();
    setState(() {
      _items = data.reversed.toList();
      print('This is to test ${_items.length}');
      // print('check ${_items[1]['note']}');
    });
  }

  Future<void> _deleteNote(int index) async {
    await _activities.delete(index);
    _refreshNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ACTIVITIES'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, newnoteRoute);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (_, index) {
            final currentItem = _items[index];
            return Card(
              child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, newnoteRoute);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        _deleteNote(currentItem['key']);
                      },
                      icon: Icon(Icons.delete),
                    )
                  ],
                ),
                isThreeLine: true,
                title: Text(
                  currentItem['title'],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  currentItem['note'],
                ),
              ),
            );
          }),
    );
  }
}

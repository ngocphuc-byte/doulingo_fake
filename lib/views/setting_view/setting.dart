import 'package:doulingo_fake/controllers/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SpeechScreen(),
    );
  }
}

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  List<Map<String, dynamic>> _items = [];

  final duolingoBox = Hive.box('duolingo');

  @override
  void initState() {
    super.initState();
    Hive.box('duolingo').clear();
    _refreshItems();
  }

  void _refreshItems() {
    final data = duolingoBox.keys.map((key) {
      final item = duolingoBox.get(key);
      return {'key': key, 'name': item['name'], 'quantity': item['quantity']};
    }).toList();
    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
    });
  }

  Future<void> _createItem(Map<String, dynamic> newItem) async {
    await duolingoBox.add(newItem);
    _refreshItems();
    // print('amount data is ${duolingoBox.length}');
  }

  Future<void> _updateItem(int itemKey, Map<String, dynamic> item) async {
    await duolingoBox.put(itemKey, item);
    _refreshItems();
  }

  Future<void> _delelteItem(int itemKey) async {
    await duolingoBox.delete(itemKey);
    _refreshItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final currentItem = _items[index];
            return SizedBox(
              width: double.maxFinite,
              height: 70,
              child: GestureDetector(
                onTap: () {
                  print(currentItem['key']);
                },
                child: Card(
                  color: Colors.amber.shade200,
                  child: ListTile(
                    title: Text(currentItem['name']),
                    subtitle: Text(currentItem['quantity']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () =>
                              _showBottonSheet(context, currentItem['key']),
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () => _delelteItem(currentItem['key']),
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottonSheet(context, null),
      ),
    );
  }

  void _showBottonSheet(BuildContext context, int? itemKey) {
    if (itemKey != null) {
      final existingItem =
          _items.firstWhere((element) => itemKey == element['key']);
      _nameController.text = existingItem['name'];
      _quantityController.text = existingItem['quantity'];
    }
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      label: Text('Name'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: _quantityController,
                    decoration: const InputDecoration(
                      label: Text('Quantity'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      child: const Text('Create'),
                      onPressed: () {
                        itemKey != null
                            ? _updateItem(itemKey, {
                                'name': _nameController.text,
                                'quantity': _quantityController.text
                              })
                            : _createItem({
                                'name': _nameController.text,
                                'quantity': _quantityController.text
                              });
                        _nameController.text = '';
                        _quantityController.text = '';
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

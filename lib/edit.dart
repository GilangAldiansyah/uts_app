import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Edit extends StatelessWidget {
  final DocumentSnapshot document;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Edit({required this.document})
      : titleController = TextEditingController(text: document['title']),
        descriptionController =
            TextEditingController(text: document['description']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Nama Resep'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Bahan - bahan'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                updateData({
                  'title': titleController.text,
                  'description': descriptionController.text,
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateData(Map<String, dynamic> newData) async {
    await _firestore.collection('data').doc(document.id).update(newData);
  }
}

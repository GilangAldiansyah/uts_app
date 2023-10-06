import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Tambah extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Resep'),
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
              decoration: InputDecoration(labelText: 'Bahan - Bahan'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                addData({
                  'title': titleController.text,
                  'description': descriptionController.text,
                });
                Navigator.pop(context);
              },
              child: Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addData(Map<String, dynamic> data) async {
    await _firestore.collection('data').add(data);
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailData extends StatelessWidget {
  final DocumentSnapshot data;

  DetailData({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Resep'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Resep:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(data['title'], style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Bahan - Bahan :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(data['description'], style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

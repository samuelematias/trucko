import 'package:flutter/material.dart';

class LocalDetailPage extends StatefulWidget {
  @override
  _LocalDetailPageState createState() => _LocalDetailPageState();
}

class _LocalDetailPageState extends State<LocalDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOL'),
      ),
      body: Container(
        child: Text('Local Detail Page'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Apology extends StatefulWidget {
  const Apology({ Key? key }) : super(key: key);

  @override
  State<Apology> createState() => _ApologyState();
}

class _ApologyState extends State<Apology> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apologies given'),
      ),
      body: Center(
        child: Icon(
          Icons.bookmark_add_outlined,
          size: 120.0,
          color: Colors.black,
        ),
      ),
      
    );
  }
}
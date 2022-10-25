import 'package:flutter/material.dart';


class About extends StatefulWidget { 
  const About({ Key? key }) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')), 
      body: Center(
        child: Text('About Screen',style: TextStyle(fontSize: 40)),
      ),
      
    );
  }
}
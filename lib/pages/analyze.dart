import 'package:flutter/material.dart';

class Analyze extends StatelessWidget {
  const Analyze({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analyze the data'),
      ),
      body: Center(
        child: Icon(
          Icons.analytics_outlined,
          size: 120.0,
          color: Colors.black,
        ),
      ),
      
    );
  }
}
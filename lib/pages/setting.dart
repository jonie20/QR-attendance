import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({ Key? key }) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')), 
      body: Center(
        child: Text('Settings Screen',style: TextStyle(fontSize: 40)),
      ),
      
    );
  }
}
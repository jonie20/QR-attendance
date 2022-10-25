import 'package:flutter/material.dart';

class Export extends StatelessWidget {
  const Export({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Export to XLS or PDF'),
      ),
      body: Center(
        child: Icon(
          Icons.import_export_outlined,
          size: 120.0,
          color: Colors.black,
        ),
      ),
      
    );
  }
}
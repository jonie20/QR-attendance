import 'package:flutter/material.dart';
import 'package:attendanceqr/pages/edit.dart';
import 'package:attendanceqr/pages/lists.dart';
import 'package:attendanceqr/pages/analyze.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);


  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final int index = 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        ),

        body: Card(
          child: ListTile(
            leading: Icon(Icons.flight),
            title: Text('Airplane $index'),
            subtitle: Text('Very Cool'),
            trailing:Text('${index * 7}%'),
            onTap: () => print('Tapped on Row $index'),
          ),
        ),
        
        
      
    );
    
  }
}
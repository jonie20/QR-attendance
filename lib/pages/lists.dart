import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:attendanceqr/pages/db.dart';
import 'package:attendanceqr/pages/edit.dart';

class Employees extends StatefulWidget {
  const Employees({ Key? key }) : super(key: key);

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {

  List<Map> slist = [];
  MyDb mydb = new MyDb();

  @override
  void initState() {
    mydb.open();
    getdata();
    super.initState();
  }

  getdata(){
    Future.delayed(Duration(milliseconds: 500),() async {
      //use delay min 500 ms, because database takes time to initilize.
        slist = await mydb.db.rawQuery('SELECT * FROM students');
        
        setState(() { }); //refresh UI after getting data from table.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of employees"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: slist.length == 0? Text("No any students to show"):
          Column(
            children: slist.map((stuone) {
              return Card(
                child: ListTile(
                  leading:Icon(Icons.people),
                  title: Text(stuone["name"]),
                  subtitle: Text("Roll No:" + stuone["roll_no"].toString()+", Add: " + stuone["address"]),
                  trailing: Wrap(children: [

                    IconButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                    return EditStudent(rollno: stuone["roll_no"]);
                                })); //navigate to edit page, pass student roll no to edit
                              }, icon: Icon(Icons.edit)),
                    IconButton(onPressed: () async {
                                   await mydb.db.rawDelete("DELETE FROM students WHERE roll_no = ?", [stuone["roll_no"]]);
                                   //delete student data with roll no.
                                   print("Data Deleted");
                                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Student Data Deleted")));
                                   getdata();
                              }, icon: Icon(Icons.delete, color:Colors.red))
                  ],),

                ),
              );
            }).toList(),
            
          ),
        ),

      ),
      
    );
  }
}
import 'package:attendanceqr/pages/lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:attendanceqr/pages/db.dart';




class Add_Employee extends StatefulWidget {
  const Add_Employee({ Key? key }) : super(key: key);

  @override
  State<Add_Employee> createState() => _Add_EmployeeState();
}

class _Add_EmployeeState extends State<Add_Employee> {

  TextEditingController name = TextEditingController();
  TextEditingController rollno = TextEditingController();
  TextEditingController address = TextEditingController();

  MyDb mydb = new MyDb();

  @override
  void initState() {
    mydb.open(); //initilization database
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Student Name",
              ),
            ),
            TextField(
              controller: rollno,
              decoration: InputDecoration(
                hintText: "Student Name",
              ),
            ),
            TextField(
              controller: address,
              decoration: InputDecoration(
                hintText: "Student Name",
              ),
            ),
            ElevatedButton(onPressed: (){

                         mydb.db.rawInsert("INSERT INTO students (name, roll_no, address) VALUES (?, ?, ?);",
                         [name.text, rollno.text, address.text]); //add student from form to database

                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("New Student Added")));
                         //show snackbar message after adding student

                         name.text = "";
                         rollno.text = "";
                         address.text = "";
                         //clear form to empty after adding data

                   }, child: Text("Save Student Data")),

          ],
        ),
      ),
      
    );
  }
}
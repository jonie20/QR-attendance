import 'package:attendanceqr/pages/about.dart';
import 'package:attendanceqr/pages/chat.dart';
import 'package:attendanceqr/pages/dashboard.dart';
import 'package:attendanceqr/pages/edit.dart';
import 'package:attendanceqr/pages/lists.dart';
import 'package:attendanceqr/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:attendanceqr/pages/analyze.dart';
import 'package:attendanceqr/pages/apology.dart';
import 'package:attendanceqr/pages/export.dart';
import 'package:attendanceqr/pages/apology.dart';
import 'package:attendanceqr/pages/add_employee.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

  
}

class _HomeState extends State<Home> {

  int currentTab=0;
  final List<Widget> screens=[
    Dashboard(),
    Chat(),
    About(),
    Setting()

  ];

   final PageStorageBucket bucket=PageStorageBucket();
   Widget currentScreen=Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // appBar: AppBar(
      //    leading: IconButton(
      //      icon: Icon(Icons.menu),
      //      onPressed: () {
      //        setState(() {
      //          menu=Drawer();
      //        });
      //      },
      //      ),
      //   ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.cover,
                  ),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: const Text('Add Employee',style: TextStyle(fontSize: 20.0)), 
              onTap: () {
                
                Navigator.pop(context);
                Navigator.push(
                  context,
                   MaterialPageRoute(
                  builder: (context)=>Add_Employee()    
                 ),
                );
              },
            ),
            Divider(color: Colors.grey,),
            ListTile(
              leading: Icon(Icons.analytics_sharp),
              title: const Text('Analysis',style: TextStyle(fontSize: 20.0)),
              onTap: () {
                // updates the state of the app
                Navigator.pop(context);
                Navigator.push(
                  context,
                   MaterialPageRoute(
                  builder: (context)=>Analyze()
                  ),
                );
              },
            ),
            Divider(color: Colors.grey,),
            ListTile(
              leading: Icon(Icons.book_online),
              title: const Text('Apology',style: TextStyle(fontSize: 20.0)),
              onTap: () {
                // updates the state of the app
                 Navigator.pop(context); 
                 Navigator.push(
                  context,
                   MaterialPageRoute(
                  builder: (context)=>Apology()
                  ),
                ); 
              },
            ),
            Divider(color: Colors.grey,),
            ListTile(
              leading: Icon(Icons.import_export),
              title: const Text('Export',style: TextStyle(fontSize: 20.0)),
              onTap: () {
                // updates the state of the app
                Navigator.pop(context);
                Navigator.push(
                  context,
                   MaterialPageRoute(
                  builder: (context)=>Export()
                  ),
                );
              },
            ),
            Divider(color: Colors.grey,),
          ],
        ),
      ),

      body: PageStorage(
        child: currentScreen,
        bucket: bucket,     
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen= Dashboard();
                          currentTab= 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.dashboard,
                            color:currentTab == 0 ? Colors.black :Colors.grey
                            ),
                            Text(
                              'Dashboard',
                              style: TextStyle(color:currentTab==0? Colors.black:Colors.grey
                              ),
                            )
                        ],
                        ),
                    ),

                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Chat();
                          currentTab= 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat,
                            color:currentTab == 2 ? Colors.black :Colors.grey
                            ),
                            Text(
                              'Chat',
                              style: TextStyle(color:currentTab==2? Colors.black:Colors.grey
                              ),
                            )
                        ],
                        ),
                    )
                  ],
                ),
                //Right Tab Bar
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen= Setting();
                          currentTab= 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            color:currentTab == 3 ? Colors.black :Colors.grey
                            ),
                            Text(
                              'Setting',
                              style: TextStyle(color:currentTab==3? Colors.black:Colors.grey
                              ),
                            )
                        ],
                        ),
                    ),

                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = About();
                          currentTab= 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color:currentTab == 1 ? Colors.black :Colors.grey
                            ),
                            Text(
                              'About',
                              style: TextStyle(color:currentTab==1? Colors.black:Colors.grey
                              ),
                            )
                        ],
                        ),
                    )
                  ],
                )
              ],
            ),
            ), 
          ), 
      );      
  }
 
  
} 


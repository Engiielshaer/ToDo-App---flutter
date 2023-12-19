import 'package:commerce_app/archivedtasks.dart';
import 'package:commerce_app/donetasks.dart';
import 'package:commerce_app/newtasks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';


class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  int currentindex=0;
  bool isBottomSheetShown=false;
  IconData fabIcon=Icons.edit;
  var titlecontroller=TextEditingController();
  var timecontroller=TextEditingController();
  var datecontroller=TextEditingController();
  bool isEmpty=false;
  List<Widget> Screens=[
    NewTasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];

  List<String> appbar=[
    'newTask',
    'DoneTasks',
    'ArchivedTasks',
  ];

  late Database database;
  var scaffoldkey=GlobalKey<ScaffoldState>();
  var formkey=GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    createDatabase();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appbar[currentindex],
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Screens[currentindex],
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          if(isBottomSheetShown){
            if(formkey.currentState!.validate()){
              Navigator.pop(context);
              isBottomSheetShown=false;
              setState(() {
                fabIcon=Icons.edit;
              });
            }
          }else{
            scaffoldkey.currentState!.showBottomSheet
              ((context) =>  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: titlecontroller,
                      keyboardType: TextInputType.text,
                      validator:(  value) {
                        if(value!.isEmpty){
                          return 'title must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'task title',
                        prefixIcon: Icon(
                          Icons.title
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: timecontroller,
                      keyboardType: TextInputType.datetime,
                      onTap: (){
                        showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now()
                        ).then((value) {
                          timecontroller .text=value!.format(context).toString();
                          print(value.format(context));
                        }
                        );
                      },
                      validator:(  value) {
                        if(value!.isEmpty){
                          return 'time must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'task time',
                        prefixIcon: Icon(
                            Icons.watch_later_outlined
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: datecontroller ,
                      keyboardType: TextInputType.datetime,
                      onTap: ()
                      {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('2024-1-25'),
                        ).then((value) {
                          print(DateFormat.yMMMd().format(value!));
                        });
                        // showDatePicker(
                        //     context: context,
                        //     initialDate: DateTime.now(),
                        //     firstDate: DateTime.now(),
                        //     lastDate: DateTime.parse('2024-1-20')
                        // ).then((value) {
                        //
                        // });

                      },
                      validator:(  value) {
                        if(value!.isEmpty){
                          return 'date must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'task date',
                        prefixIcon: Icon(
                            Icons.calendar_today
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
            ),
                ),
              )
            );
            isBottomSheetShown=true;
             setState(() {
               fabIcon=Icons.add;
             });
          }


        },
        child: Icon(
          fabIcon,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          currentIndex: currentindex,
           onTap: (index){
             setState(() {
              currentindex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
            Icons.menu
          ),
              label: 'tasks'
          ),
          BottomNavigationBarItem(
              icon: Icon(
              Icons.cloud_done_rounded
          ),
              label: 'done'
          ),
          BottomNavigationBarItem(
              icon: Icon(
              Icons.archive_outlined
          ),
              label: 'archived tasks'
          ),
        ],
      ),
    );
  }
  Future<String> getName() async
  {
    return 'engii elshaer';
  }

  void createDatabase() async
  {
      database= await openDatabase(
      'todo.db',
      version:1,
      onCreate: (database,version)
      {
        print('database created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)').then((value)
        {
          print('table created');
        }).catchError((error){
          print('error when creating table ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        print('database opened');
      }

    );
  }
  void insertToDatabase()
  {
    database.transaction((txn)  async
      {
      txn.rawInsert('INSERT INTO tasks(title,date,time,status) VALUES ("first task","02222","543","new")').then((value) {
        print('$value inserted successfully');
      }).catchError((error){
        print('error when inserting new record ${error.toString()}');
      });

    });
  }

}

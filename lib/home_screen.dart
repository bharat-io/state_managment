import 'package:counter_app/bloc%20with%20Db/screen/todo_list_screen.dart';
import 'package:counter_app/bloc%20with%20map/notelist_screen.dart';
import 'package:counter_app/cubit/student_list.dart';

import 'package:counter_app/provider/employe_data_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("rebuilding ");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EmployeData()));
                  },
                  child: Text("provider")),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => StudentList()));
                  },
                  child: Text("Cubit")),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NotelistScreen()));
                  },
                  child: Text("Bloc with map")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TodoListScreen()));
                  },
                  child: Text("Bloc with DB"))
            ],
          ),
        ));
  }
}

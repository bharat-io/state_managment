import 'package:counter_app/cubit/student_list.dart';
import 'package:counter_app/provider/counter_page.dart';
import 'package:counter_app/provider/counter_provider.dart';
import 'package:counter_app/provider/employe_data_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CounterPage()));
                  },
                  child: Text("Counter App")),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EmployeData()));
                  },
                  child: Text("List App")),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => StudentList()));
                  },
                  child: Text("Cubit"))
            ],
          ),
        ));
  }
}

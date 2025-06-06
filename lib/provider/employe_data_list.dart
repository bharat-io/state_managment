import 'package:counter_app/provider/add_emp_data.dart';
import 'package:counter_app/provider/empdata_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeData extends StatefulWidget {
  const EmployeData({super.key});

  @override
  State<EmployeData> createState() => _EmployeDataState();
}

class _EmployeDataState extends State<EmployeData> {
  List<Map<String, dynamic>> empList = [];

  @override
  Widget build(BuildContext context) {
    var empProvider = context.read<EmpDataProvider>();
    print("rebuilding");
    return Scaffold(
      appBar: AppBar(
        title: Text("Employe Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(builder: (ctx, provider, __) {
              empList = ctx.watch<EmpDataProvider>().getempData();
              return Expanded(
                child: ListView.builder(
                    itemCount: empList.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              children: [
                                Text(
                                  empList[index]["name"],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  empList[index]["email"],
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          153, 68, 67, 67)),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddEmpData(
                                  exsitingNameText: empList[index]["name"],
                                  existingEmailText: empList[index]["email"],
                                  index: index,
                                  onSave: (name, email, i) {
                                    empProvider.updateEmpData(
                                        name, email, index);
                                  },
                                ),
                              ));
                            },
                            child: Icon(Icons.edit),
                          ),
                          InkWell(
                            onTap: () {
                              empProvider.deleteData(index);
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ));
                    }),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddEmpData(
              onSave: (name, email, _) {
                empProvider.addEmpData(name, email);
              },
            ),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

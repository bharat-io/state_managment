import 'package:counter_app/cubit/add_student.dart';
import 'package:counter_app/cubit/student_cubit.dart';
import 'package:counter_app/cubit/student_cubitState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Student Records",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 5,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          nameController.clear();
          rollNoController.clear();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddStudentData(
              titleName: "Add Student",
              buttonName: "Add",
              onTap: () {
                context.read<StudentCubit>().addStudent(
                      nameController.text,
                      int.parse(rollNoController.text),
                    );
                Navigator.of(context).pop();
              },
              nameController: nameController,
              rollNumberController: rollNoController,
            ),
          ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<StudentCubit, StudentCubitstate>(
        builder: (context, state) {
          final students = state.studentData;

          if (students.isEmpty) {
            return const Center(
              child: Text(
                "No students yet. Click + to add one!",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      student["rollNo"].toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    student["name"],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "Roll No: ${student["rollNo"]}",
                    style: const TextStyle(fontSize: 14),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.orange),
                        onPressed: () {
                          nameController.text = student["name"];
                          rollNoController.text = student["rollNo"].toString();

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddStudentData(
                              titleName: "Edit Student",
                              buttonName: "Update",
                              onTap: () {
                                context.read<StudentCubit>().updateStudent(
                                      nameController.text,
                                      int.parse(rollNoController.text),
                                      index,
                                    );
                                Navigator.of(context).pop();
                              },
                              nameController: nameController,
                              rollNumberController: rollNoController,
                            ),
                          ));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _showDeleteConfirmation(context, index);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Delete Student"),
        content: const Text("Are you sure you want to delete this student?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              context.read<StudentCubit>().deleteStudent(index);
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}

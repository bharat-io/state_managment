import 'package:flutter/material.dart';

class AddEmpData extends StatelessWidget {
  final String? exsitingNameText;
  final String? existingEmailText;
  final int? index;
  final void Function(String name, String email, int? index) onSave;

  const AddEmpData({
    super.key,
    this.exsitingNameText,
    this.existingEmailText,
    this.index,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: exsitingNameText ?? '');
    TextEditingController emailController =
        TextEditingController(text: existingEmailText ?? '');

    return Scaffold(
      appBar:
          AppBar(title: Text(index == null ? "Add Employee" : "Edit Employee")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: "Name")),
            SizedBox(height: 15),
            TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: "Email")),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                onSave(nameController.text, emailController.text, index);
                Navigator.pop(context);
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}

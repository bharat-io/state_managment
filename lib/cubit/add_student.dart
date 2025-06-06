import 'package:counter_app/cubit/texfield_widget.dart';
import 'package:flutter/material.dart';

class AddStudentData extends StatefulWidget {
  AddStudentData(
      {super.key,
      required this.titleName,
      required this.buttonName,
      required this.onTap,
      required this.nameController,
      required this.rollNumberController});
  final String? titleName;
  final String? buttonName;
  final void Function()? onTap;
  TextEditingController nameController;
  TextEditingController rollNumberController;
  @override
  State<AddStudentData> createState() => _AddStudentDataState();
}

class _AddStudentDataState extends State<AddStudentData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TexfieldWidget(
              title: widget.titleName!,
              nameController: widget.nameController,
              rollNumberController: widget.rollNumberController,
              onTap: () {
                widget.onTap!();
              },
              buttonText: widget.buttonName!)
        ],
      ),
    );
  }
}

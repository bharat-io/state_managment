import 'package:counter_app/cubit/database/db_heleper.dart';
import 'package:counter_app/cubit/student_cubitState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubit extends Cubit<StudentCubitstate> {
  StudentCubit() : super(StudentCubitstate(studentData: []));
  DbHelper dbHeleper = DbHelper.getInstance();

  void fetchSutdent() async {
    List<Map<String, dynamic>> allStudents = await dbHeleper.fetchData();
    emit(StudentCubitstate(studentData: allStudents));
  }

  void addStudent(String name, int rollNo) async {
    final success = await dbHeleper.addData(name: name, rollNo: rollNo);

    if (success) {
      List<Map<String, dynamic>> allStudents = await dbHeleper.fetchData();
      emit(StudentCubitstate(studentData: allStudents));
    }
  }

  void updateStudent(String name, int rollNo, int id) async {
    bool success =
        await dbHeleper.updateData(id: id, name: name, rollNo: rollNo);

    if (success) {
      List<Map<String, dynamic>> updatedStudent = await dbHeleper.fetchData();
      emit(StudentCubitstate(studentData: updatedStudent));
    }
  }

  void deleteStudent(int id) async {
    bool success = await dbHeleper.deleteData(id);
    if (success) {
      List<Map<String, dynamic>> updatedStudent = await dbHeleper.fetchData();
      emit(StudentCubitstate(studentData: updatedStudent));
    }
  }
}

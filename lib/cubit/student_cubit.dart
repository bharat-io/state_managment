import 'package:counter_app/cubit/student_cubitState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubit extends Cubit<StudentCubitstate> {
  StudentCubit() : super(StudentCubitstate(studentData: []));

  void addStudent(String name, int rollNo) {
    Map<String, dynamic> students = {"name": name, "rollNo": rollNo};
    List<Map<String, dynamic>> initialSutdents = state.studentData;
    initialSutdents.add(students);
    emit(StudentCubitstate(studentData: initialSutdents));
  }

  void updateStudent(String name, int rollNo, int index) {
    Map<String, dynamic> students = {"name": name, "rollNo": rollNo};
    List<Map<String, dynamic>> initialSutdents = state.studentData;
    initialSutdents[index] = students;
    emit(StudentCubitstate(studentData: initialSutdents));
  }

  void deleteStudent(int index) {
    List<Map<String, dynamic>> initialSutdents = state.studentData;
    initialSutdents.removeAt(index);
    emit(StudentCubitstate(studentData: initialSutdents));
  }
}

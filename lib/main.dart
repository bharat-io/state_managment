import 'package:counter_app/bloc%20with%20Db/bloc/todo_bloc.dart';
import 'package:counter_app/bloc%20with%20map/database/note_bloc/note_bloc.dart';
import 'package:counter_app/cubit/student_cubit.dart';
import 'package:counter_app/provider/counter_provider.dart';
import 'package:counter_app/provider/empdata_provider.dart';
import 'package:counter_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context) => NoteBloc()),
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EmpDataProvider(),
        ),
        BlocProvider(create: (context) => StudentCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

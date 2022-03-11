import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rasan_flutter_assessment/presentation/color_form_ui.dart';

import 'data/validation/validator.dart';
import 'domain/cubit/form_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const ColorFormUi(),
      home: BlocProvider(
        create: (context) => FormCubit(FormValidator()),
        child:const ColorFormUi(),
      ),
    );
  }
}

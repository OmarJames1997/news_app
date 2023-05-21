import 'package:booking_ps_figma/data/cubit/cubit.dart';
import 'package:booking_ps_figma/data/cubit/states.dart';
import 'package:booking_ps_figma/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'UI/screens/layout_screen.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: BlocBuilder<AppCubit,AppStates>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LayoutScreen(),
        ),
      ),
    );
  }
}



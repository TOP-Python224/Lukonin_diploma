// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/models/user_cubite.dart';
import 'package:front/models/user_models.dart';
import 'package:front/ui/common/app_colors.dart';
import 'ui/views/home_page/home_view.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UserCubit(User());
      },
      child: MaterialApp(
        title: 'Mushu`s Academy',
        theme: ThemeData(
          focusColor: kcPrimaryColor,
          primaryColor: kcPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
              ),
        ),
        home: HomeView(),
      ),
    );
  }
}

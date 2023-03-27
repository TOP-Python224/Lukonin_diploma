// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/models/user_cubite.dart';
import 'package:front/models/user_models.dart';
import 'package:front/ui/common/app_colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    User user = context.read<UserCubit>().state;
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: Text(
            'MainPage'
            '\nFirst name: ${user.first_name}'
            '\nLast name: ${user.last_name}'
            '\nEmail: ${user.email}'
            '\nID: ${user.id}'
            '\nToken: ${user.token}\n'),
      ),
    );
  }
}

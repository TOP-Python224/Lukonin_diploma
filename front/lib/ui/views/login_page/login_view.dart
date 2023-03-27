// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/api/auth_api.dart';
import 'package:front/ui/common/app_colors.dart';
import 'package:front/ui/common/app_constants.dart';
import 'package:front/ui/common/ui_helpers.dart';
import 'package:front/ui/views/home_page/home_view.dart';
import 'package:front/ui/views/main_page/main_page.dart';

import '../../../models/user_cubite.dart';
import '../../../models/user_models.dart';
import '../../common/shered_styles.dart';
import 'widgets/text_button.dart';
import 'widgets/text_fields.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        // Outside Row
        body: Center(
          child: SizedBox(
            width: kdDesktopMaxContentWidth,
            height: kdDesktopMaxContentHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  'Mushu`s Academy',
                  style: ktsBodyTitle.copyWith(fontWeight: FontWeight.w800),
                ),

                const Spacer(
                  flex: 2,
                ),

                //Auth

                Container(
                  height: kdLoginMaxContentHeight,
                  width: kdLoginMaxContentWidth,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 18, 82, 45)
                                .withOpacity(0.6),
                            blurRadius: 16,
                            offset: Offset(3, 3))
                      ],
                      borderRadius: BorderRadius.circular(32),
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(157, 34, 173, 57),
                        Color.fromARGB(216, 28, 118, 141)
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 32),
                    child: Column(
                      children: [
                        //TextField Email
                        CustomTextFields(
                          hint: 'Enter your username or email',
                          controller: emailController,
                        ),
                        verticalSpaceSmall,
                        //TextField Password
                        CustomTextFields(
                          hint: 'Enter your password',
                          controller: passwordController,
                        ),
                        verticalSpaceLarge,

                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/mushu_auth.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),

                        //Button
                        SizedBox(
                            width: kdDesktopMaxContentWidth / 5,
                            child: CustomTextButton(
                              onTap: () async {
                                var authRes = await userAuth(
                                    emailController.text,
                                    passwordController.text);
                                if (authRes.runtimeType == String) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          child: Container(
                                              height: 200,
                                              width: 250,
                                              decoration: BoxDecoration(),
                                              child: Text(
                                                authRes,
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                        );
                                      });
                                } else if (authRes.runtimeType == User) {
                                  User user = authRes;
                                  context.read<UserCubit>().emit(user);
                                  Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return MainPage();
                                  },
                                  ));
                                }
                              },
                              title: 'Login',
                            )),
                      ],
                    ),
                  ),
                ),

                const Spacer(flex: 3),
              ],
            ),
          ),
        ));
    ;
  }
}



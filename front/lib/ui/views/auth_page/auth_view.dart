// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/api/auth_api.dart';
import 'package:front/ui/common/app_colors.dart';
import 'package:front/ui/common/app_constants.dart';
import 'package:front/ui/common/ui_helpers.dart';
import 'package:front/ui/views/auth_page/widgets/text_button.dart';
import 'package:front/ui/views/auth_page/widgets/text_fields.dart';

import 'package:front/ui/views/main_page/main_page.dart';

import '../../../models/user_cubite.dart';
import '../../../models/user_models.dart';
import '../../common/shered_styles.dart';
import '../login_page/login_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  void _tomain() {
    final navigator = Navigator.of(context);
    navigator.push(MaterialPageRoute<void>(builder: (context) => MainPage()));
  }

  void _tologin() {
    final navigator = Navigator.of(context);
    navigator.push(MaterialPageRoute<void>(builder: (context) => LoginView()));
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
                  height: kdAuthMaxContentHeight,
                  width: kdAuthMaxContentWidth,
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
                        vertical: 32, horizontal: 16),
                    child: Column(
                      children: [
                        //TextField Username
                        CustomTextFields(
                          hint: "Enter your Username",
                          controller: usernameController,
                        ),
                        verticalSpaceSmall,
                        //TextField Email
                        CustomTextFields(
                          hint: "Enter your Email",
                          controller: emailController,
                        ),
                        verticalSpaceSmall,
                        CustomTextFields(
                          hint: "Enter your first name",
                          controller: firstNameController,
                        ),
                        verticalSpaceSmall,
                        CustomTextFields(
                          hint: "Enter your last name",
                          controller: lastNameController,
                        ),
                        verticalSpaceSmall,
                        //TextField Password
                        CustomTextFields(
                          hint: "Enter your Password",
                          controller: passwordController,
                        ),
                        verticalSpaceSmall,
                        //TextField ConfirmPassword
                        CustomTextFields(
                          hint: "Confirm youe password",
                          controller: confirmPasswordController,
                        ),

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
                        CustomTextButton(
                          title: "Registration",
                          onTap: () async {
                            var authRes = await registerUser(
                                usernameController.text,
                                emailController.text,
                                passwordController.text,
                                confirmPasswordController.text,
                                firstNameController.text,
                                lastNameController.text);

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
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                    );
                                  });
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return LoginView();
                                },
                              ));
                            }
                          },
                        ),
                        verticalSpaceSmall,
                        TextButton(
                            onPressed: (_tologin),
                            child: Text(
                                "Если уже есть аккаунт, необходимо войти",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14)))
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ));
    ;
  }
}

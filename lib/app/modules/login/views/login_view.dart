import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Hello Welcome to our App',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Welcome to visit our site',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Form(
                  key: controller.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                  children: [
                    TextFormField(
                      controller: controller.emailController.value,
                      // onSaved: (value){
                      //   controller.email.value = value!;
                      // },
                      // validator: (value){
                      //   return controller.validateEmail(value!);
                      // },
                      decoration: const InputDecoration(
                        hintText: "Email Id",
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFormField(
                      controller: controller.passwordController.value,
                      obscureText: true,
                      // onSaved: (value){
                      //   controller.password.value = value!;
                      // },
                      // validator: (value){
                      //   return controller.validatePassword(value!);
                      // },
                      decoration: const InputDecoration(hintText: "password"),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),


                    ElevatedButton(onPressed: () {
                      // controller.checklogin();
                      controller.loginWithEmail(controller.emailController.value.text,controller.passwordController.value.text);
                    }, child: const Text("Login"))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';
class LoginController extends GetxController {
  //TODO: Implement LoginController
  final formKey = GlobalKey<FormState>();
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  var email=''.obs;
  var password=''.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  String? validateEmail(String value){
    if(!GetUtils.isEmail(value)){
      return "Provide Email Id";
    }
    return  null;
  }

  String? validatePassword(String value){
    if(value.length > 6){
      return "Password Must be 6  characters";
    }
    return  null;
  }

  void  checklogin(){
    final isvalid =formKey.currentState!.validate();
    if(!isvalid){
      return;
    }
    formKey.currentState!.save();
  }

  Future<void> loginWithEmail(String email,String password) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      var url = Uri.parse("https://dummyjson.com/auth/login");
      Map body = {
        'username': email.toString(),
        'password': password.toString()
      };
      http.Response response =
      await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        emailController.value.clear();
        passwordController.value.clear();
        Get.offAllNamed(Routes.HOME);
        print(response.body);
        // if (json['code'] == 0) {
        //   var token = json['data']['Token'];
        //   // final SharedPreferences? prefs = await _prefs;
        //   // await prefs?.setString('token', token);
        //
        //
        // } else if (json['code'] == 1) {
        //   throw jsonDecode(response.body)['message'];
        // }
      } else {
        throw jsonDecode(response.body)["Message"] ?? "Unknown Error Occured";
      }
    } catch (error) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
  }
}

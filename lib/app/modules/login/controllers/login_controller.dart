import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}

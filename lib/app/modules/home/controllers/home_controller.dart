import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../Model/getDemoModel.dart';

class HomeController extends GetxController  with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController
  Rx<TabController>? tabController;
  RxInt selectedIndex = 0.obs;
  final count = 0.obs;
  var UserList = <getDemoModel>[].obs;
  RxBool hasData = false.obs;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this).obs;
    fetchAlbumData();
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

  Future<void> fetchAlbumData() async {
    UserList.clear();
    // hasData.value = false;
    http.Response response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users"))
        .catchError((error) {
      print("Error: $error");
    });
    if (response.statusCode == 200) {
      hasData.value = true;
      print("Data := ${jsonDecode(response.body)}");

      List<dynamic> res = jsonDecode(response.body);
      res.forEach((element) {
        UserList.add(getDemoModel.fromJson(element));
      });
      print("My Data := ${UserList}");
    } else {
      hasData.value = true;
      Get.snackbar('Error Loding Data!',
          'Server responded:${response.statusCode}:${response.reasonPhrase
              .toString()}');
    }
  }
}
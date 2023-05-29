import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../Model/getDemoModel.dart';

class HomeController extends GetxController  with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Every  Day'),
    const Tab(text: 'Every hour'),
  ];
  late TabController controller;
  final count = 0.obs;
  var UserList = <getDemoModel>[].obs;
  RxBool hasData = false.obs;

  @override
  void onInit() {
    controller = TabController(vsync: this, length: myTabs.length);
    controller.addListener(() {
      print("index${controller.index}");
    });
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
    http.Response response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users"))
        .catchError((error) {
      print("Error: $error");
    });
    print("Data := ${response.statusCode}");
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
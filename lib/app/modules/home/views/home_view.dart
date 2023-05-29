import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:practiceforlogin/main.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () {
                box.erase();
                Get.offAllNamed(Routes.LOGIN);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 15, right: 8),
                child: Text(
                  "Log Out",
                  style: TextStyle(fontSize: 12.sp),
                ),
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue
              ),
                child: Column(
              children: [],
            ))
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

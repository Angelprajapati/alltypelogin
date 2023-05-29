import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:practiceforlogin/main.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (context) {
        return Obx(()=> Scaffold(
          backgroundColor: controller.selectedIndex.value == 0
              ? Colors.yellow
              : controller.selectedIndex.value == 1
              ? Colors.green
              : controller.selectedIndex.value == 2
              ? Colors.blueAccent
              : controller.selectedIndex.value == 3
              ? Colors.grey
              : Colors.white,
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
                  const DrawerHeader(
                      decoration: BoxDecoration(
                          color: Colors.lightBlue
                      ),
                      child: Column(
                        children: [],
                      ))
                ],
              ),
            ),
            // body:  Center(
            //   child: DefaultTabController(
            //     length: 3,
            //     child: Column(
            //       children: [
            //         const Text(
            //           'HomeView is working',
            //           style: TextStyle(fontSize: 20),
            //         ),
            //         Container(
            //             height: 45,
            //             decoration: BoxDecoration(
            //                 color: Colors.grey[300],
            //                 borderRadius: BorderRadius.circular(10.0)),
            //             child: TabBar(
            //               controller: controller.controller,
            //               indicator: BoxDecoration(
            //                   // color: ColorConstant.blueFE,
            //                   borderRadius: BorderRadius.circular(10.0)),
            //               labelColor: Colors.white,
            //               unselectedLabelColor: Colors.black,
            //
            //               tabs:  controller.myTabs,
            //             )),
            //
            //       ],
            //     ),
            //   ),
            // ),
            body:  Center(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.UserList.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                              onTap: () {
                                // Get.to(Profile(),arguments: {
                                //   "id":controller.UserList[i].id,
                                //   "name":controller.UserList[i].name,
                                //   "email":controller.UserList[i].email,
                                //   "mobile":controller.UserList[i].mobile,
                                //   "adr":controller.UserList[i].adr,
                                //   "gender":controller.UserList[i].gender,
                                //   "role":controller.UserList[i].role,
                                //   "salary":controller.UserList[i].salary,
                                //   "pass":controller.UserList[i].pass,
                                //   "img":controller.UserList[i].img,
                                //   "date":controller.UserList[i].date,
                                //   "joining":controller.UserList[i].joining,
                                // });
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    border: Border.all(),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15))),
                                child: ListTile(
                                  title: Mygetwidget(
                                      tital: "Name",
                                      data: "${controller.UserList[i].name}"),
                                  subtitle: Mygetwidget(
                                      tital: "Email",
                                      data: "${controller.UserList[i].email}"),
                                  trailing: IconButton(
                                    onPressed: () async {
                                      // await controller.deletuser(controller.UserList[i].email);
                                      controller.fetchAlbumData();
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
                    Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TabBar(
                            onTap: (index) {
                              controller.selectedIndex.value = index;
                            },
                            tabs: [
                              Tab(child: Icon(Icons.home)),
                              Tab(child: Icon(Icons.search_rounded)),
                              Tab(child: Icon(Icons.account_box)),
                              Tab(child: Icon(Icons.settings)),
                            ],
                            isScrollable: true,
                            labelPadding:
                            EdgeInsets.symmetric(horizontal: 30),
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.orange),
                            controller: controller.tabController!.value,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: TabBarView(
                            controller: controller.tabController!.value,
                            children: [
                              Container(
                                  color: Colors.yellow,
                                  child: Center(
                                      child: Text(
                                        "HOME",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Colors.white),
                                      ))),
                              Container(
                                  color: Colors.green,
                                  child: Center(
                                      child: Text(
                                        "SERACH",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Colors.white),
                                      ))),
                              Container(
                                  color: Colors.blueAccent,
                                  child: Center(
                                      child: Text(
                                        "PERSON",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Colors.white),
                                      ))),
                              Container(
                                  color: Colors.grey,
                                  child: Center(
                                      child: Text(
                                        "SETTING",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Colors.white),
                                      ))),
                            ]))
                  ],
                )
            ),
          ),
        );
      }
    );
  }

  Widget Mygetwidget({required String tital, required String data}) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 5),
      child: Text(
        "$tital:-$data",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
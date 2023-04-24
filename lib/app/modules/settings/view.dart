import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:farmmobile/app/core/utils/extensions.dart';
import 'package:farmmobile/app/modules/home/controller.dart';

import '../../core/utils/gradientText.dart';


class SettingsPage extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  // final controller = Get.find<NutriListController>();
  final TextEditingController _textEditingController = TextEditingController();
  
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 250, 244),
      appBar: AppBar(
        title: Text('Settings',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 20.0.sp,
              fontWeight: FontWeight.bold,
            )
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.plus_one, color: Colors.black),
            onPressed: () {
              // if (controller.tasks.isNotEmpty) {
              //   Get.to(() => AddDialog(), transition: Transition.downToUp);
              // } else {
              //   EasyLoading.showInfo('Please show your task type');
              // }
            },
          )
        ],        
      ),        
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        child: TextField(
                          controller: _textEditingController,
                          // onChanged: (_) {
                          //   controller.onSearchChanged(value: _);
                          // },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(), hintText: "Search"),
                          textAlignVertical: TextAlignVertical.bottom,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Obx(() => controller.filteredNutris.isEmpty ? const Text("No data") 
              //   : Column(
              //     children: [
              //       // ...controller.filteredNutris
              //       //   .map((element) => _information(context, element))
              //       //   .toList(),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

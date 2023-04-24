import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:farmmobile/app/core/utils/extensions.dart';
import 'package:farmmobile/app/modules/home/controller.dart';

import 'package:farmmobile/app/modules/crops/controller.dart';
import 'package:farmmobile/app/data/models/crop.dart';


import '../../core/utils/gradientText.dart';


class CropsPage extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  // final crop_controller = Get.find<CropsController>();  
  final TextEditingController _textEditingController = TextEditingController();


  CropsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 250, 244),
      appBar: AppBar(
        title: Text('Crop Database',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0.sp,
            fontWeight: FontWeight.bold,
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
              // Obx(() => crop_controller.filteredCrops.isEmpty ? const Text("No data") 
              //   : Column(
              //     children: [
              //       ...crop_controller.filteredCrops
              //         .map((element) => _information(context, element))
              //         .toList(),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _information(BuildContext context, Crop crop) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 16,
      shadowColor: Colors.grey,
      child: InkWell(
        onTap: () {
          // Get.toNamed("/crops/crop", arguments: crop);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  crop.photo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      crop.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      crop.description,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Text('Rating: 4.5'),
                        Icon(Icons.star),
                        Text('Rating: 5'),                        
                      ],
                    ),                                        
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


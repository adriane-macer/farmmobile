import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:farmmobile/app/data/services/storage/repository.dart';
import 'package:farmmobile/app/data/services/crop.dart';

import '../../data/models/crop.dart';

import 'dart:convert';



class CropsController extends GetxController {
  RxList<Crop> crops = <Crop>[].obs;
  RxList<Crop> filteredCrops = <Crop>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      crops.value =
          CropService.to.crops;
      filteredCrops.value = crops;
    } catch (e) {
      debugPrint("CropsController._initialize: $e");
    }
  }

  void onSearchChanged({String? value}) {
    debugPrint("CropsController.onSearchChanged: $value");
    if (value == null || value.isEmpty) {
      filteredCrops(crops);
      return;
    }

    filteredCrops.value = crops
        .where((Crop element) => _hasMatched(element, value))
        .toList();
  }

  bool _hasMatched(Crop crop, String searchString) {
    if (crop.name.toString().toLowerCase().contains(searchString)) {
      return true;
    }
    bool hasMatched = false;
    for (int i = 0; i < crop.description.length; ++i) {
      if (crop.description[i].toLowerCase().contains(searchString)) {
        hasMatched = true;
        break;
      }
    }
    return hasMatched;
  }
}


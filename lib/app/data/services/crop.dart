import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/crop.dart';


class CropService extends GetxService {
  static CropService get to => Get.find();

  List<Crop> crops = [];

  Future<CropService> init() async {
    String jsonString =
        await rootBundle.loadString("assets/jsons/crops.json");

    final jsonResponse = jsonDecode(jsonString) as List;
    debugPrint("CropService.init: $jsonResponse");
    try {
      crops = jsonResponse.map((data) => Crop.fromJson(data)).toList();
    } catch (e) {
      debugPrint("CropService.init: $e");
    }

    return this;
  }
}

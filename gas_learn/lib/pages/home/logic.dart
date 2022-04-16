import 'package:flutter/foundation.dart';
import 'package:gas_learn/common/request.dart';
import 'package:gas_learn/model/read_content.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  static HomeLogic get to => Get.find();
  List contentsList = <ReadContentModel>[].obs;
  Future getAllContent(int kind) async {
    var response = await Request.getAllContent(kind);
    var contents = response.data;
    contentsList = <ReadContentModel>[];
    for (var i = 1;  i< contents.length; i++) {
      var _content = ReadContentModel(
          contents[i][0].toString(),
          contents[i][1],
          contents[i][2],
          contents[i][3],
          contents[i][4]);
      contentsList.add(_content);
    }

    if (kDebugMode) {
      print(response.data[1][1]);
    }
  }
}

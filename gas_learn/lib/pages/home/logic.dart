import 'package:gas_learn/common/request.dart';
import 'package:gas_learn/model/read_content.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  static HomeLogic get to => Get.find();
  final contentsList = <ReadContentModel>[].obs;

  Future getAllContent(int kind) async {
    var response = await Request.getAllContent(kind);
    var contents = response.data;
    contentsList.clear();
    for (var i = 1;  i< contents.length; i++) {
      var _content = ReadContentModel(
          contents[i][0].toString(),
          contents[i][1],
          contents[i][2],
          contents[i][3],
          contents[i][4].toString());
      contentsList.add(_content);
    }
    update();
  }

  Future getContentByKeyword(int kind, String keyword) async {
    var response = await Request.getContentByKeyWord(kind, keyword);
    var contents = response.data;

    contentsList.clear();

    List temContentsList = <ReadContentModel>[];
    for (var i = 0;  i< contents.length; i++) {
      var _content = ReadContentModel(
          contents[i][0].toString(),
          contents[i][1],
          contents[i][2],
          contents[i][3],
          contents[i][4].toString());
      temContentsList.add(_content);
    }

    contentsList.add(temContentsList[0]);
    for(var i = 1;  i< temContentsList.length; i++) {
      bool recoveryFlag = true;
      for (var j = 0; j < contentsList.length; j++) {
        if(contentsList[j].id == temContentsList[i].id) {
          recoveryFlag = false;
        }
      }
      if (recoveryFlag) {
        contentsList.add(temContentsList[i]);
      }
    }
    update();
  }

  Future deleteContent(int kind, int itemId) async {
    await Request.deleteContent(kind, itemId + 1);
  }
}

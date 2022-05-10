import 'package:gas_learn/common/request.dart';
import 'package:gas_learn/model/read_content.dart';
import 'package:get/get.dart';

class AddEditContentLogic extends GetxController {
  static AddEditContentLogic get to => Get.find();

  String? selectedValue;

  Future addContent(int kind, ReadContentModel itemContents) async {
    String addContents = itemContents.id + "," +
            itemContents.name + "," +
            itemContents.transName + "," +
            itemContents.description + "," +
            itemContents.point;

    await Request.addContent(kind, addContents);
  }

  Future editContent(int kind, ReadContentModel itemContents,int itemId) async {
    String editContents = itemContents.id + "," +
        itemContents.name + "," +
        itemContents.transName + "," +
        itemContents.description + "," +
        itemContents.point;
    itemId = itemId + 1;

    await Request.editContent(kind, editContents, itemId);
  }
}

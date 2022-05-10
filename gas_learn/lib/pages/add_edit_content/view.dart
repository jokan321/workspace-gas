import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gas_learn/model/read_content.dart';
import 'package:gas_learn/pages/home/view.dart';
import 'package:get/get.dart';

import 'logic.dart';

class AddEditContentPage extends StatefulWidget {
   const AddEditContentPage({Key? key,
     required this.kind,
     required this.readContentModel,
     required this.actionFlag,
     }) : super(key: key);
  final int actionFlag;
  final int kind;
  final ReadContentModel readContentModel;

  @override
  State<StatefulWidget> createState() => _AddEditContentPageState();
}

class _AddEditContentPageState extends State<AddEditContentPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _traNameController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();

  List<String> pointItems = [
    "⭐️",
    "⭐⭐️️",
    "⭐️⭐️⭐️",
    "⭐️⭐️⭐️⭐️",
    "⭐️⭐️⭐️⭐️⭐️"
  ];

  String? selectedValue;

  @override
  void initState() {
    _nameController.text = widget.readContentModel.name;
    _traNameController.text = widget.readContentModel.transName;
    _summaryController.text = widget.readContentModel.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(AddEditContentLogic());

    if(selectedValue == null && widget.readContentModel.point != "") {
      selectedValue = pointItems[int.parse(widget.readContentModel.point) - 1];
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.actionFlag==0?"追加内容":"変更内容"),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/doraamonback2.jpeg"),
                fit: BoxFit.cover
            )
        ),
        child:
        Column(
          children: [
            const SizedBox(
              height: 15,
            ),

            SizedBox(
              width: Get.width - 80,
              child: const Text("作品名",
                textAlign: TextAlign.left, textScaleFactor: 1.2,),
            ),

            SizedBox(
              width: Get.width - 50,
              child: Card(
                elevation: 5,
                child: TextField(
                  controller: _nameController,
                  autofocus: true,
                  decoration: const InputDecoration(

                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            SizedBox(
              width: Get.width - 80,
              child: const Text("通訳名",
                textAlign: TextAlign.left, textScaleFactor: 1.2,),
            ),

            SizedBox(
              width: Get.width - 50,
              child: Card(
                elevation: 5,
                child: TextField(
                  controller: _traNameController,
                  autofocus: true,
                  decoration: const InputDecoration(

                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            SizedBox(
              width: Get.width - 80,
              child: const Text("概略",
                textAlign: TextAlign.left, textScaleFactor: 1.2,),
            ),

            SizedBox(
              width: Get.width - 50,
              child: Card(
                elevation: 5,
                child: TextField(
                  controller: _summaryController,
                  autofocus: true,
                  maxLines: 4,
                  decoration: const InputDecoration(

                  ),
                ),
              ),
            ),

            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(17.0))
              ),
              elevation: 5,
              child: CustomDropdownButton2(
                  hint: "ポイントを選択",
                  value: selectedValue,
                  dropdownItems: pointItems,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  }),
            ),
            ElevatedButton(onPressed: () {
              if(selectedValue == null || _nameController.text.isEmpty) {
                Get.snackbar(
                    "警告！",
                    "必須な内容を入力してください(作品名とポイント)",
                    icon: const Icon(Icons.error_outline));
                return;
              }

              ReadContentModel content = ReadContentModel(
                  "=ROW()-1",
                  _nameController.text,
                  _traNameController.text,
                  _summaryController.text,
                  (pointItems.indexOf(selectedValue!) + 1).toString());

              if(widget.actionFlag == 0) {
                logic.addContent(widget.kind, content);
                Get.to(HomePage(kind: widget.kind,));
              } else {
                logic.editContent(
                    widget.kind,
                    content,
                    int.parse(widget.readContentModel.id));
                Get.to(HomePage(kind: widget.kind,));
              }
            }, child: Text(widget.actionFlag==0?"追加":"変更"))
          ],
        ),
      ),
    );
  }
}

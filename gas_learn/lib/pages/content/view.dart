import 'package:flutter/material.dart';
import 'package:gas_learn/model/read_content.dart';
import 'package:get/get.dart';

import '../add_edit_content/view.dart';

class ContentPage extends StatelessWidget {
  const ContentPage({Key? key,
    required this.kind,
    required this.readContentModel}) : super(key: key);
  final int kind;
  final ReadContentModel readContentModel;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("内容詳細"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: ()=> Get.to(AddEditContentPage(
            actionFlag: 1,
            kind: kind,
            readContentModel: readContentModel)),

      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/doraamonback.jpeg"),
              fit: BoxFit.cover
          )
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                width: Get.width - 50,
                child: Card(
                  color: const Color.fromRGBO(223, 240, 254, 1),
                  child: ListTile(
                    leading: const Image(image: AssetImage("images/doraamonicon1.jpeg")),
                    title: const Text("作品名:"),
                    subtitle: Text(readContentModel.name),

                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: Get.width - 50,
                child: Card(
                  color: const Color.fromRGBO(223, 240, 254, 1),
                  child: ListTile(
                    leading: const Image(image: AssetImage("images/doraamonicon4.jpeg")),
                    title: const Text("評価:"),
                    subtitle: Text(getPointStar()),

                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: Get.width - 50,
                child: Card(
                  color: const Color.fromRGBO(223, 240, 254, 1),
                  child: ListTile(
                    leading: const Image(image: AssetImage("images/doraamonicon2.jpeg")),
                    title: const Text("通訳名:"),
                    subtitle: Text(readContentModel.transName),

                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: Get.width - 50,
                child: Card(
                  color: const Color.fromRGBO(223, 240, 254, 1),
                  child: ListTile(
                    leading: const Image(image: AssetImage("images/doraamonicon3.jpeg")),
                    title: const Text("概要:"),
                    subtitle: Text(readContentModel.description),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getPointStar () {
    String pointStart = "";
    var _intPoint = int.parse(readContentModel.point);
    for(var i = 0; i< _intPoint; i++) {
      pointStart += "⭐️";
    }

    return pointStart;
  }
}

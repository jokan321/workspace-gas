import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gas_learn/model/read_content.dart';
import 'package:gas_learn/pages/content/view.dart';
import 'package:get/get.dart';

class SlidableWidget extends StatelessWidget {
  const SlidableWidget({Key? key,
    required this.kind,
    required this.readContentModel,
    required this.nagFunction}) : super(key: key);

  final int kind;
  final ReadContentModel readContentModel;

  final Function nagFunction;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // dismissibleを使う場合は必須
        key: const ValueKey(0),
        // 右から出てくる
        endActionPane: ActionPane(
          // ActionPaneの出現アニメーション（必須）
          motion: const DrawerMotion(),
          // 出てくるWidgetを指定（必須）
          children: [
            SlidableAction(
              onPressed: (context) {
                nagFunction();
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: ListTile(
          title: Text(readContentModel.id + ": " +readContentModel.name),
          onTap: () {
            Get.to(ContentPage(
                kind: kind,
                readContentModel: readContentModel,));
          },
        )
    );
  }

}
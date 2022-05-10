import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({Key? key, required this.actFunction}) : super(key: key);
  final Function actFunction;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text("警告！！！"),
      content: const Text("このアイテムを削除しますか"),
      actions: [
        CupertinoDialogAction(
            child: const Text('キャンセル'),
            isDestructiveAction: true,
            onPressed: () {
              Get.back();
            }),
        CupertinoDialogAction(
          child: const Text('はい'),
          onPressed: () {
            actFunction();
            Get.back();
          },
        )
      ],
    );
  }
  
}
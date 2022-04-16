// Slidable(
// // dismissibleを使う場合は必須
// key: const ValueKey(0),
// // 左から出てくる
// startActionPane: ActionPane(
// // ActionPaneの出現アニメーション（必須）
// motion: const DrawerMotion(),
// // 最後までスワイプしたときにこのSlidableを消す（keyが必須）
// dismissible: DismissiblePane(onDismissed: () {}),
// // 出てくるWidgetを指定（必須）
// children: [
// SlidableAction(
// onPressed: (context) {},
// backgroundColor: const Color(0xFFFE4A49),
// foregroundColor: Colors.white,
// icon: Icons.delete,
// label: 'Delete',
// ),
// ],
// ),
// // 右から出てくる
// endActionPane: ActionPane(
// motion: const DrawerMotion(),
// children: [
// SlidableAction(
// autoClose: false,
// onPressed: (context) {},
// backgroundColor: const Color(0xFF21B7CA),
// foregroundColor: Colors.white,
// icon: Icons.push_pin,
// label: 'Pin',
// ),
// ],
// ),
// child: const ListTile(
// title: Text('リスト'),
// )
// )
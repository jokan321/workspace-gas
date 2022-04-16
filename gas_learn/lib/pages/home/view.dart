import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> list = <Widget>[];

  @override
  void initState() {
    list
      ..add(const AnimeScreen())
      ..add(const DramaScreen())
      ..add(const MovieScreen())
      ..add(const BookScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>HomeLogic());
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon:Icon(
                Icons.animation,
                color: Colors.blueGrey,
              ),
              label: "アニメ"
          ),
          BottomNavigationBarItem(
              icon:Icon(
                Icons.tv_outlined,
                color: Colors.blueGrey,
              ),
              label: "ドラマ"
          ),
          BottomNavigationBarItem(
              icon:Icon(
                Icons.movie_creation_outlined,
                color: Colors.blueGrey,
              ),
              label: "映画"
          ),
          BottomNavigationBarItem(
              icon:Icon(
                Icons.menu_book,
                color: Colors.blueGrey,
              ),
              label: "本"
          )
        ],
        currentIndex: _currentIndex,
        onTap: (int index) async {
          await HomeLogic.to.getAllContent(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class AnimeScreen extends StatelessWidget {
  const AnimeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.put(HomeLogic());
    Widget _listItemBuilder(BuildContext context, int index) {
      return Slidable(
        // dismissibleを使う場合は必須
          key: const ValueKey(0),
          // 右から出てくる
          endActionPane: ActionPane(
            // ActionPaneの出現アニメーション（必須）
            motion: const DrawerMotion(),
            // 最後までスワイプしたときにこのSlidableを消す（keyが必須）
            dismissible: DismissiblePane(onDismissed: () {}),
            // 出てくるWidgetを指定（必須）
            children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: const ListTile(
            title: Text("这是测试"),
          )
      );
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("タイトル"),
        ),
        body: GetBuilder<HomeLogic>(
          builder: (s) => ListView.builder(
              itemBuilder: _listItemBuilder, itemCount: s.contentsList.length),
        ),
    );
  }

}

class DramaScreen extends StatelessWidget {
  const DramaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("これがテストです"),
          onPressed: () {

          },
        ),
      ),
    );
  }

}

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ShareLife"),
      ),
      body: Center(
        child: Container(),
      ),
    );
  }

}

class BookScreen extends StatelessWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SelfLife"),
      ),
      body: Center(
        child: Container(),
      ),
    );
  }

}


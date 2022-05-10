import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gas_learn/common/widget/dialog.dart';
import 'package:gas_learn/common/widget/slidable.dart';
import 'package:gas_learn/model/read_content.dart';
import 'package:get/get.dart';
import '../add_edit_content/view.dart';
import 'logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.kind}) : super(key: key);
  final int kind;

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
    _currentIndex = widget.kind;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>HomeLogic());

    final TextEditingController _searchKeywordController = TextEditingController();

    Future<void> getAllData() async {
          await EasyLoading.show(status: "loading...", maskType: EasyLoadingMaskType.black);
          await HomeLogic.to.getAllContent(_currentIndex);
          EasyLoading.dismiss();
    }

    Future<void> getDataByKeyword()async {
      await EasyLoading.show(status: "loading...", maskType: EasyLoadingMaskType.black);
      await HomeLogic.to.getContentByKeyword(_currentIndex, _searchKeywordController.text);
      EasyLoading.dismiss();
    }

    getAllData();

    String appbarTitle = "";
    switch(_currentIndex){
      case 0:
        appbarTitle = "アニメ";
        break;
      case 1:
        appbarTitle = "ドラマ";
        break;
      case 2:
        appbarTitle = "映画";
        break;
      default:
        appbarTitle = "本";
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.to(AddEditContentPage(
          actionFlag: 0,
          kind: _currentIndex,
          readContentModel: ReadContentModel("", "", "", "", ""),)),
      ),
      appBar: AppBar(
        title: TextField(
          controller: _searchKeywordController,
          decoration: InputDecoration.collapsed(
            hintText: appbarTitle,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () {
            if(_searchKeywordController.text.isNotEmpty) {
              getDataByKeyword();
            }
          }, icon: const Icon(Icons.search))
        ],
        centerTitle: true,
      ),

      body: GetBuilder<HomeLogic>(
        builder: (s) => list[_currentIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon:Icon(
                Icons.animation,
                color: Colors.lightBlue,
              ),
              label: "アニメ"
          ),
          BottomNavigationBarItem(
              icon:Icon(
                Icons.tv_outlined,
                color: Colors.lightBlue,
              ),
              label: "ドラマ"
          ),
          BottomNavigationBarItem(
              icon:Icon(
                Icons.movie_creation_outlined,
                color: Colors.lightBlue,
              ),
              label: "映画"
          ),
          BottomNavigationBarItem(
              icon:Icon(
                Icons.menu_book,
                color: Colors.lightBlue,
              ),
              label: "本"
          )
        ],
        fixedColor: Colors.lightBlue,
        currentIndex: _currentIndex,
        onTap: (int index) async {
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
    Get.lazyPut(()=>HomeLogic());

    return Scaffold(
        body: GetBuilder<HomeLogic>(
          builder: (s) => ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return SlidableWidget(
                    readContentModel: s.contentsList[index],
                    kind: 0,
                    nagFunction: () => showDialog(context: context, builder: (context) {
                      return DialogWidget(
                        actFunction: () async {
                          await HomeLogic.to.deleteContent(0, int.parse(s.contentsList[index].id));
                          await EasyLoading.show(status: "削除中...", maskType: EasyLoadingMaskType.black);
                          await HomeLogic.to.getAllContent(0);
                          EasyLoading.dismiss();
                        },
                      );
                    })
                );
              }, itemCount: s.contentsList.length),
        ),
    );
  }

}

class DramaScreen extends StatelessWidget {
  const DramaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>HomeLogic());

    return Scaffold(
      body: GetBuilder<HomeLogic>(
        builder: (s) => ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return SlidableWidget(
                  readContentModel: s.contentsList[index],
                  kind: 1,
                  nagFunction: () => showDialog(context: context, builder: (context) {
                    return DialogWidget(
                      actFunction: () async {
                        await HomeLogic.to.deleteContent(1, int.parse(s.contentsList[index].id));
                        await EasyLoading.show(status: "削除中...", maskType: EasyLoadingMaskType.black);
                        await HomeLogic.to.getAllContent(1);
                        EasyLoading.dismiss();
                      },
                    );
                  })
              );
            }, itemCount: s.contentsList.length),
      ),
    );
  }
}

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>HomeLogic());

    return Scaffold(
      body: GetBuilder<HomeLogic>(
        builder: (s) => ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return SlidableWidget(
                  readContentModel: s.contentsList[index],
                  kind: 2,
                  nagFunction: () => showDialog(context: context, builder: (context) {
                    return DialogWidget(
                      actFunction: () async {
                        await HomeLogic.to.deleteContent(2, int.parse(s.contentsList[index].id));
                        await EasyLoading.show(status: "削除中...", maskType: EasyLoadingMaskType.black);
                        await HomeLogic.to.getAllContent(2);
                        EasyLoading.dismiss();
                      },
                    );
                  })
              );
            }, itemCount: s.contentsList.length),
      ),
    );
  }

}

class BookScreen extends StatelessWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>HomeLogic());

    return Scaffold(
      body: GetBuilder<HomeLogic>(
        builder: (s) => ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return SlidableWidget(
                  readContentModel: s.contentsList[index],
                  kind: 3,
                  nagFunction: () => showDialog(context: context, builder: (context) {
                    return DialogWidget(
                        actFunction: () async {
                          await HomeLogic.to.deleteContent(3, int.parse(s.contentsList[index].id));
                          await EasyLoading.show(status: "削除中...", maskType: EasyLoadingMaskType.black);
                          await HomeLogic.to.getAllContent(3);
                          EasyLoading.dismiss();
                        },
                    );
                  })
              );
            }, itemCount: s.contentsList.length),
      ),
    );
  }

}

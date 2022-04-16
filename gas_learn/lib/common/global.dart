import 'package:gas_learn/common/request.dart';

class Global {
  static Future init() async {
    await Request().init();
  }
}
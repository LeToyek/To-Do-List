import 'package:flutter/foundation.dart';

class DoneProvider extends ChangeNotifier {
  final List<String> _doneModuleList = [];

  List<String> get doneModuleList => _doneModuleList;

  void addData(String moduleName) {
    _doneModuleList.add(moduleName);
    notifyListeners();
  }
}

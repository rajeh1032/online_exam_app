import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class SaveExamIdProvider extends ChangeNotifier {
  String? examId;
  setExamId(String newExamId) {
    examId = newExamId;
    notifyListeners();
  }
}

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:online_exam_app/core/models/exam_result.dart';

class ExamResultStorage {
  static const String _boxName = 'exam_results';
  static Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ExamResultAdapter());
    }

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(QuestionResultAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(AnswerOptionAdapter());
    }
    if (!Hive.isBoxOpen(_boxName)) {
      await Hive.openBox<ExamResult>(_boxName);
    }
  }

  static Future<void> saveExamResult(ExamResult result) async {
    final box = Hive.box<ExamResult>(_boxName);
    await box.put(result.examId, result);
  }

  static ExamResult? getExamResult(String examId) {
    final box = Hive.box<ExamResult>(_boxName);
    return box.get(examId);
  }

  static List<ExamResult> getAllExamResults() {
    final box = Hive.box<ExamResult>(_boxName);
    return box.values.toList();
  }

  static Future<void> deleteExamResult(String examId) async {
    final box = Hive.box<ExamResult>(_boxName);
    await box.delete(examId);
  }

  static Future<void> clearAllResults() async {
    final box = Hive.box<ExamResult>(_boxName);
    await box.clear();
  }

  static bool hasExamResult(String examId) {
    final box = Hive.box<ExamResult>(_boxName);
    return box.containsKey(examId);
  }

  static List<ExamResult> getExamResultsByTitle(String title) {
    final box = Hive.box<ExamResult>(_boxName);
    return box.values.where((result) => result.examTitle == title).toList();
  }

  static List<ExamResult> getRecentResults({int limit = 10}) {
    final box = Hive.box<ExamResult>(_boxName);
    final results = box.values.toList();
    results.sort((a, b) => b.completedAt.compareTo(a.completedAt));
    return results.take(limit).toList();
  }
}

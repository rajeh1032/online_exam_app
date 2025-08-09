import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/models/exam_result.dart';
import 'package:online_exam_app/core/utils/exam_result_storage.dart';
import 'package:online_exam_app/features/auth/presentation/auth/widgets/build_app_bar.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/widgets/quiz_result_widget.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/widgets/result_widgets/no_results_widget.dart';
import 'package:online_exam_app/features/home_screen/tabs/result_tab/presentation/widgets/result_widgets/result_card.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({super.key});

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  List<ExamResult> examResults = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _loadExamResults();
  }

  void _loadExamResults() async {
    setState(() {
      isLoading = true;
    });
    try {
      examResults = ExamResultStorage.getAllExamResults();
      examResults.sort((a, b) => b.completedAt.compareTo(a.completedAt));
    } catch (e) {
      print('Error loading exam results: $e');
      examResults = [];
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BuildAppBar(title: "Results"),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : examResults.isEmpty
                ? const NoResultsWidget()
                : Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Text(
                          'Your Exam Results',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                          child: RefreshIndicator(
                        onRefresh: () async => _loadExamResults(),
                        child: ListView.builder(
                            itemCount: examResults.length,
                            itemBuilder: (context, index) {
                              return ResultCard(
                                  result: examResults[index],
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QuizResultWidget(
                                            examResult: examResults[index]),
                                      ),
                                    );
                                  });
                            }),
                      ))
                    ],
                  ));
  }
}

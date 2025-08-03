import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/constant/constants.dart';
import 'package:online_exam_app/core/di/di.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/cubit/home_view_model.dart';
import 'package:online_exam_app/features/home_screen/tabs/home_tab/presentation/widgets/build_home_tab_body.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late final HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<HomeViewModel>();
    viewModel.getAllSubjects();

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(Constants.surveyTitle,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20.sp,
                  )),
          automaticallyImplyLeading: false,
          centerTitle: false,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Colors.transparent,
        ),
        body: const BuildHomeTabBody(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/core/constant/constants.dart';

import '../../../../../../core/di/di.dart';
import '../../../../../../core/route/app_routes.dart';
import '../../../../../../core/utils/dialog_utils.dart';
import '../cubit/states/signup_states.dart';
import '../cubit/view_models/signup_view_model.dart';
import '../widgets/signup_form_widget.dart';



class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignUpViewModel signUpViewModel = getIt<SignUpViewModel>();
  @override
  void initState() {
    super.initState();

    signUpViewModel.signUpUsernameController.addListener(_onFormChanged);
    signUpViewModel.signUpFirstNameController.addListener(_onFormChanged);
    signUpViewModel.signUpLastNameController.addListener(_onFormChanged);
    signUpViewModel.signUpEmailController.addListener(_onFormChanged);
    signUpViewModel.signUpPasswordController.addListener(_onFormChanged);
    signUpViewModel.signUpRePasswordController.addListener(_onFormChanged);
    signUpViewModel.signUpPhoneController.addListener(_onFormChanged);
  }
  @override
  void dispose() {

    signUpViewModel.signUpUsernameController.removeListener(_onFormChanged);
    signUpViewModel.signUpFirstNameController.removeListener(_onFormChanged);
    signUpViewModel.signUpLastNameController.removeListener(_onFormChanged);
    signUpViewModel.signUpEmailController.removeListener(_onFormChanged);
    signUpViewModel.signUpPasswordController.removeListener(_onFormChanged);
    signUpViewModel.signUpRePasswordController.removeListener(_onFormChanged);
    signUpViewModel.signUpPhoneController.removeListener(_onFormChanged);
    super.dispose();
  }
  void _onFormChanged() {
    signUpViewModel.checkFormValidation();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpViewModel, SignUpStates>(
      bloc: signUpViewModel,
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          DialogUtils.showLoading(
              context: context, message: Constants.loadingMessage);
        } else if (state is SignUpErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failures.errorMessage,
              title: Constants.errorTitle,
              posActionName: Constants.ok);
        } else if (state is SignUpSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: Constants.signUpSuccessMessage,
              title: Constants.successTitle,
              posActionName: Constants.ok,
              posAction: () {
                //todo: save token in shared pref
                // SharedPreferenceUtils.saveData(
                //     key: 'token', value: state.loginResponseEntity.token);

                Navigator.pushReplacementNamed(context, AppRoutes.login);
              });
        }
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
              },
            ),
            title: Text(
              Constants.signUpTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: SafeArea(
            child:SignupFormWidget(signUpViewModel: signUpViewModel) ,
          ),
        );
      },
    );
  }
}

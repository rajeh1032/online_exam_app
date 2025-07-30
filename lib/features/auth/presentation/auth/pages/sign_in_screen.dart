
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/local_storage/secure_storage_service.dart';
import '../../../../../core/route/app_routes.dart';
import '../cubit/states/sign_in_state.dart';
import '../cubit/view_models/sign_in_view_model.dart';
import '../widgets/form/sign_in_form.dart';
import '../widgets/handle_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInViewModel>(
      create: (context) => getIt<SignInViewModel>(),
      child: BlocListener<SignInViewModel, SignInState>(
        listenWhen: (previous, current) =>
        previous.status != current.status,
        listener: (context, state) {
          handleState(
            context: context,
            status: state.status,
            successMessage: state.response?.message ?? '',
            errorMessage: state.errorMsg ?? '',
            onSuccess: ()  async{
              final token = state.response?.token;
              if (token != null) {
                final secureStorage = getIt<SecureStorageService>();
                await secureStorage.saveToken(token);

                if (!context.mounted) return;
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.homeScreen,
                      (route) => false,
                );
              }
            },
          );
        },
        child: const SignInForm(),
      ),
    );
  }
}

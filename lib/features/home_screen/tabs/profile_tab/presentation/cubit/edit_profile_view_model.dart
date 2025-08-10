import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/request/edit_profile_request_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/edit_profile_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/get_user_data_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/usecases/edit_profile_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/usecases/get_user_data_use_case.dart';
import '../../../../../../core/constant/constants.dart';
import 'edit_profile_states.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final EditProfileUseCase _editProfileUseCase;

  EditProfileViewModel(
    this._getUserDataUseCase,
    this._editProfileUseCase,
  ) : super(const EditProfileState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String _originalUserName = '';
  String _originalFirstName = '';
  String _originalLastName = '';
  String _originalEmail = '';
  String _originalPhone = '';

  void onFormChangedHandler() {
    final isValid = formKey.currentState?.validate() ?? false;
    final hasChanged = hasFormChanged;

    emit(state.copyWith(
      isFormValid: isValid,
      hasFormChanged: hasChanged,
    ));
  }

  Future<void> getUserData() async {
    emit(state.copyWith(status: EditProfileStatus.loading));

    final result = await _getUserDataUseCase.call();

    switch (result) {
      case ApiSuccessResult<GetUserDataResponseEntity>():
        final user = result.data.user;
        _populateControllers(user);
        emit(state.copyWith(
          status: EditProfileStatus.success,
          response: user,
        ));

      case ApiErrorResult<GetUserDataResponseEntity>():
        emit(state.copyWith(
          status: EditProfileStatus.error,
          errorMsg: result.errorMsg,
        ));
    }
  }

  void _populateControllers(dynamic user) {
    _originalUserName = user?.username ?? '';
    _originalFirstName = user?.firstName ?? '';
    _originalLastName = user?.lastName ?? '';
    _originalEmail = user?.email ?? '';
    _originalPhone = user?.phone ?? '';

    userNameController.text = _originalUserName;
    firstNameController.text = _originalFirstName;
    lastNameController.text = _originalLastName;
    emailController.text = _originalEmail;
    phoneNumberController.text = _originalPhone;
  }

  bool get hasFormChanged {
    return userNameController.text != _originalUserName ||
        firstNameController.text != _originalFirstName ||
        lastNameController.text != _originalLastName ||
        emailController.text != _originalEmail ||
        phoneNumberController.text != _originalPhone;
  }

  Future<void> editProfile() async {
    if (state.status == EditProfileStatus.loading) return;
    if (formKey.currentState?.validate() != true) {
      emit(state.copyWith(isFormValid: false));
      return;
    }

    if (!hasFormChanged) {
      emit(state.copyWith(
        status: EditProfileStatus.error,
        errorMsg: Constants.noChangesMadeToUpdate,
      ));
      return;
    }

    emit(state.copyWith(status: EditProfileStatus.loading));

    final result = await _editProfileUseCase.call(
      EditProfileRequestEntity(
        userName: userNameController.text.trim(),
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        phone: phoneNumberController.text.trim(),
      ),
    );

    switch (result) {
      case ApiSuccessResult<EditProfileResponseEntity>():
        _updateOriginalValues();
        emit(state.copyWith(
          status: EditProfileStatus.success,
          isFormValid: false,
          response: result.data.user,
          hasFormChanged: false,
        ));

      case ApiErrorResult<EditProfileResponseEntity>():
        emit(state.copyWith(
          status: EditProfileStatus.error,
          errorMsg: result.errorMsg,
        ));
    }
  }

  void _updateOriginalValues() {
    _originalUserName = userNameController.text.trim();
    _originalFirstName = firstNameController.text.trim();
    _originalLastName = lastNameController.text.trim();
    _originalEmail = emailController.text.trim();
    _originalPhone = phoneNumberController.text.trim();
  }

  // void resetForm() {
  //   userNameController.text = _originalUserName;
  //   firstNameController.text = _originalFirstName;
  //   lastNameController.text = _originalLastName;
  //   emailController.text = _originalEmail;
  //   phoneNumberController.text = _originalPhone;
  //   formKey.currentState?.reset();
  // }

  @override
  Future<void> close() {
    userNameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}

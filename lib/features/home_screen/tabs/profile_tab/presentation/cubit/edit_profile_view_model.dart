import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/api_result/api_result.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/request/edit_profile_request_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/edit_profile_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/response/get_user_data_response_entity.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/usecases/edit_profile_use_case.dart';
import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/usecases/get_user_data_use_case.dart';
import '../../../../../../core/constant/constants.dart';
import '../../../../../../core/provider/profile_photo_provider.dart';
import 'edit_profile_states.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileState> {
  final GetUserDataUseCase _getUserDataUseCase;
  final EditProfileUseCase _editProfileUseCase;
  final ImagePicker _picker = ImagePicker();
  final ProfilePhotoProvider _profilePhotoProvider;



  EditProfileViewModel(
    this._getUserDataUseCase,
    this._editProfileUseCase,
    this._profilePhotoProvider,
  ) : super(EditProfileState(
    selectedImagePath: _profilePhotoProvider.photoPath,
  ));

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

  Future<void> pickProfileImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      emit(state.copyWith(selectedImagePath: pickedFile.path));

      await _profilePhotoProvider.setPhoto(pickedFile.path);
    }
  }

  String? get photoPath => _profilePhotoProvider.photoPath;

  Future<void> initializeProfilePhoto() async {
    final savedPhotoPath = _profilePhotoProvider.photoPath;

    if (savedPhotoPath != null && savedPhotoPath.isNotEmpty) {
      final file = File(savedPhotoPath);
      if (await file.exists()) {
        emit(state.copyWith(selectedImagePath: savedPhotoPath));
      } else {
        await _profilePhotoProvider.clearPhoto();
      }
    }
  }

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
}

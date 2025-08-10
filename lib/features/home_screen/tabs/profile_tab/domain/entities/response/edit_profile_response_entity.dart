import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/profile_user_entity.dart';

class EditProfileResponseEntity {
  String? message;
  ProfileUserEntity? user;

  EditProfileResponseEntity({
    this.message,
    this.user,
  });
}

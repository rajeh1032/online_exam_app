import 'package:online_exam_app/features/home_screen/tabs/profile_tab/domain/entities/profile_user_entity.dart';

class GetUserDataResponseEntity {
  String? message;
  ProfileUserEntity? user;

  GetUserDataResponseEntity({
    this.message,
    this.user,
  });
}

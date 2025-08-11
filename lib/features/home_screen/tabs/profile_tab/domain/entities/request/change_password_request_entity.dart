class ChangePasswordRequestEntity {
  final String? oldPassword;
  final String? password;
  final String? rePassword;

  const ChangePasswordRequestEntity({
    this.oldPassword,
    this.password,
    this.rePassword,
  });
}
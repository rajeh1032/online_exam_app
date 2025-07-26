import 'package:flutter/material.dart';

import '../../../../../core/constant/constants.dart';
import '../../../../../core/utils/dialog_utils.dart';

void handleState<T>({
  required BuildContext context,
  required T status,
  required String successMessage,
  required String errorMessage,
  VoidCallback? onSuccess,
  VoidCallback? onError,
}) {
  if (status.toString().contains(Constants.loading)) {
    DialogUtils.showLoading(
      context: context,
      message: Constants.loadingMessage,
    );
  } else if (status.toString().contains(Constants.error)) {
    DialogUtils.hideLoading(context);
    DialogUtils.showMessage(
      context: context,
      message: errorMessage,
      title: Constants.errorTitle,
      posActionName: Constants.ok,
      posAction: onError,
    );
  } else if (status.toString().contains(Constants.success)) {
    DialogUtils.hideLoading(context);
    DialogUtils.showMessage(
      context: context,
      message: successMessage,
      title: Constants.successTitle,
      posActionName: Constants.ok,
      posAction: onSuccess,
    );
  }
}

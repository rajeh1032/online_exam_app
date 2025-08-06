import 'package:flutter/material.dart';

import '../l10n/translation/app_localizations.dart';

class LocalizedErrorHandler {
  static String getErrorMessage(BuildContext context, String? errorKey) {
    final local = AppLocalizations.of(context)!;

    if (errorKey == null) return local.unexpected_error;

    final map = {
      'no_internet': local.no_internet,
      'timeout': local.timeout,
      'unauthorized': local.unauthorized,
      'username_already_exists': local.username_already_exists,
      'server_error': local.server_error,
      'network_error': local.network_error,
      'unexpected_error': local.unexpected_error,
    };

    return map[errorKey] ?? local.unexpected_error;
  }
}

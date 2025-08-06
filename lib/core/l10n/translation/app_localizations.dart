import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'translation/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Online Exam App'**
  String get appName;

  /// No description provided for @test.
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get test;

  /// No description provided for @no_route.
  ///
  /// In en, this message translates to:
  /// **'No Route'**
  String get no_route;

  /// No description provided for @sign_up_title.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get sign_up_title;

  /// No description provided for @username_label.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username_label;

  /// No description provided for @first_name_label.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get first_name_label;

  /// No description provided for @last_name_label.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get last_name_label;

  /// No description provided for @email_label.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email_label;

  /// No description provided for @password_label.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password_label;

  /// No description provided for @confirm_password_label.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_password_label;

  /// No description provided for @phone_label.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_label;

  /// No description provided for @sign_up_button.
  ///
  /// In en, this message translates to:
  /// **'Signup'**
  String get sign_up_button;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_account;

  /// No description provided for @loading_message.
  ///
  /// In en, this message translates to:
  /// **'Please wait...'**
  String get loading_message;

  /// No description provided for @success_title.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success_title;

  /// No description provided for @error_title.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error_title;

  /// No description provided for @sign_up_success_message.
  ///
  /// In en, this message translates to:
  /// **'Sign up successful!'**
  String get sign_up_success_message;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @user_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your user name'**
  String get user_name_hint;

  /// No description provided for @first_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter first name'**
  String get first_name_hint;

  /// No description provided for @last_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter last name'**
  String get last_name_hint;

  /// No description provided for @email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get email_hint;

  /// No description provided for @password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get password_hint;

  /// No description provided for @confirm_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirm_password_hint;

  /// No description provided for @phone_number_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get phone_number_hint;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @remember_me.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get remember_me;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget Password?'**
  String get forget_password;

  /// No description provided for @do_not_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get do_not_have_account;

  /// No description provided for @continue_string.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_string;

  /// No description provided for @forget_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forget Password'**
  String get forget_password_title;

  /// No description provided for @forget_password_message.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email associated to your account'**
  String get forget_password_message;

  /// No description provided for @email_verification_title.
  ///
  /// In en, this message translates to:
  /// **'Email Verification'**
  String get email_verification_title;

  /// No description provided for @email_verification_message.
  ///
  /// In en, this message translates to:
  /// **'Please enter the verification code sent to your email'**
  String get email_verification_message;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend '**
  String get resend_code;

  /// No description provided for @didnt_receive_code.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code? '**
  String get didnt_receive_code;

  /// No description provided for @invalid_code.
  ///
  /// In en, this message translates to:
  /// **'Invalid code, please try again.'**
  String get invalid_code;

  /// No description provided for @reset_password_title.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password_title;

  /// No description provided for @reset_password_message.
  ///
  /// In en, this message translates to:
  /// **'Password must not be empty and must contain 6 characters with upper case letter and one number at least '**
  String get reset_password_message;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @resend_code_success_message.
  ///
  /// In en, this message translates to:
  /// **'Verification code resent successfully. Please check your email.'**
  String get resend_code_success_message;

  /// No description provided for @exam_title.
  ///
  /// In en, this message translates to:
  /// **'Exam'**
  String get exam_title;

  /// No description provided for @loading_question.
  ///
  /// In en, this message translates to:
  /// **'Loading question...'**
  String get loading_question;

  /// No description provided for @loading_answer.
  ///
  /// In en, this message translates to:
  /// **'Loading answer...'**
  String get loading_answer;

  /// No description provided for @no_questions_available.
  ///
  /// In en, this message translates to:
  /// **'No questions available'**
  String get no_questions_available;

  /// No description provided for @back_button_text.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back_button_text;

  /// No description provided for @next_button_text.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next_button_text;

  /// No description provided for @time_up.
  ///
  /// In en, this message translates to:
  /// **'Time up!'**
  String get time_up;

  /// No description provided for @true_string.
  ///
  /// In en, this message translates to:
  /// **'True'**
  String get true_string;

  /// No description provided for @email_not_found_error.
  ///
  /// In en, this message translates to:
  /// **'Email not found. Please try again.'**
  String get email_not_found_error;

  /// No description provided for @explore_title.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore_title;

  /// No description provided for @result_title.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get result_title;

  /// No description provided for @profile_title.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile_title;

  /// No description provided for @survey_title.
  ///
  /// In en, this message translates to:
  /// **'Survey'**
  String get survey_title;

  /// No description provided for @browse_by_subject.
  ///
  /// In en, this message translates to:
  /// **'Browse by Subject'**
  String get browse_by_subject;

  /// No description provided for @search_hint_text.
  ///
  /// In en, this message translates to:
  /// **'Search '**
  String get search_hint_text;

  /// No description provided for @unexpected_error.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get unexpected_error;

  /// No description provided for @no_subjects_available.
  ///
  /// In en, this message translates to:
  /// **'No subjects available'**
  String get no_subjects_available;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @subject_info_missing.
  ///
  /// In en, this message translates to:
  /// **'Subject information is missing. Please select a subject to view exams.'**
  String get subject_info_missing;

  /// No description provided for @high_level.
  ///
  /// In en, this message translates to:
  /// **'High Level'**
  String get high_level;

  /// No description provided for @no_exams_available.
  ///
  /// In en, this message translates to:
  /// **'No exams available for this subject'**
  String get no_exams_available;

  /// No description provided for @invalid_navigation_data.
  ///
  /// In en, this message translates to:
  /// **'Invalid navigation data'**
  String get invalid_navigation_data;

  /// No description provided for @exam_minutes_suffix.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get exam_minutes_suffix;

  /// No description provided for @exam_question_suffix.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get exam_question_suffix;

  /// No description provided for @exam_from_label.
  ///
  /// In en, this message translates to:
  /// **'From:'**
  String get exam_from_label;

  /// No description provided for @exam_to_label.
  ///
  /// In en, this message translates to:
  /// **'To:'**
  String get exam_to_label;

  /// No description provided for @exam_start_time.
  ///
  /// In en, this message translates to:
  /// **'1.00'**
  String get exam_start_time;

  /// No description provided for @exam_end_time.
  ///
  /// In en, this message translates to:
  /// **'6.00'**
  String get exam_end_time;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_profile;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @exam.
  ///
  /// In en, this message translates to:
  /// **'Exam'**
  String get exam;

  /// No description provided for @exam_score.
  ///
  /// In en, this message translates to:
  /// **'Exam Score'**
  String get exam_score;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @show_results.
  ///
  /// In en, this message translates to:
  /// **'Show Results'**
  String get show_results;

  /// No description provided for @start_again.
  ///
  /// In en, this message translates to:
  /// **'Start Again'**
  String get start_again;

  /// No description provided for @time_out.
  ///
  /// In en, this message translates to:
  /// **'Time Out !!'**
  String get time_out;

  /// No description provided for @view_score.
  ///
  /// In en, this message translates to:
  /// **'View Score'**
  String get view_score;

  /// No description provided for @correct.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get correct;

  /// No description provided for @incorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect'**
  String get incorrect;

  /// No description provided for @instructions.
  ///
  /// In en, this message translates to:
  /// **'Instructions'**
  String get instructions;

  /// No description provided for @no_internet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection. Please check your network.'**
  String get no_internet;

  /// No description provided for @timeout.
  ///
  /// In en, this message translates to:
  /// **'The connection has timed out. Please try again later.'**
  String get timeout;

  /// No description provided for @unauthorized.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password'**
  String get unauthorized;

  /// No description provided for @server_error.
  ///
  /// In en, this message translates to:
  /// **'Server error. Please try again later.'**
  String get server_error;

  /// No description provided for @network_error.
  ///
  /// In en, this message translates to:
  /// **'Network error occurred. Please try again.'**
  String get network_error;

  /// No description provided for @unexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get unexpected;

  /// No description provided for @username_already_exists.
  ///
  /// In en, this message translates to:
  /// **'Username already exists. Please choose a different one.'**
  String get username_already_exists;

  /// No description provided for @welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcome_back;

  /// No description provided for @welcome_back_description.
  ///
  /// In en, this message translates to:
  /// **'We remember you! Would you like to continue to your dashboard?'**
  String get welcome_back_description;

  /// No description provided for @continue_text.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_text;

  /// No description provided for @sign_in_again.
  ///
  /// In en, this message translates to:
  /// **'Sign In Again'**
  String get sign_in_again;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

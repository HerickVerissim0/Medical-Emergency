import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// Language selection
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Settings screen title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Customization section
  ///
  /// In en, this message translates to:
  /// **'Customization'**
  String get customization;

  /// Notifications section
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Help section
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// App guide title
  ///
  /// In en, this message translates to:
  /// **'App Guide'**
  String get appGuide;

  /// How to use guide
  ///
  /// In en, this message translates to:
  /// **'How to use the app'**
  String get howToUse;

  /// Welcome message
  ///
  /// In en, this message translates to:
  /// **'Welcome to Medical Emergency'**
  String get welcome;

  /// Emergency procedures title
  ///
  /// In en, this message translates to:
  /// **'Emergency Procedures'**
  String get emergencyProcedures;

  /// Essential resources title
  ///
  /// In en, this message translates to:
  /// **'Essential Resources'**
  String get essentialResources;

  /// Screen customization title
  ///
  /// In en, this message translates to:
  /// **'Screen Customization'**
  String get screenCustomization;

  /// Themes description
  ///
  /// In en, this message translates to:
  /// **'Themes, colors and fonts'**
  String get themes;

  /// Notification settings title
  ///
  /// In en, this message translates to:
  /// **'Notifications and Quick Settings'**
  String get notificationSettings;

  /// Manage alerts description
  ///
  /// In en, this message translates to:
  /// **'Manage alerts and sounds'**
  String get manageAlerts;

  /// Language section title
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSection;

  /// Language selection dialog title
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// Language selection option
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// Theme customization screen title
  ///
  /// In en, this message translates to:
  /// **'Theme Customization'**
  String get themeCustomization;

  /// Dark mode option
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Dark mode description
  ///
  /// In en, this message translates to:
  /// **'Change colors to a dark theme'**
  String get darkModeDesc;

  /// High contrast option
  ///
  /// In en, this message translates to:
  /// **'High Contrast'**
  String get highContrast;

  /// High contrast description
  ///
  /// In en, this message translates to:
  /// **'Increase contrast for better visibility'**
  String get highContrastDesc;

  /// Font size adjustment title
  ///
  /// In en, this message translates to:
  /// **'Adjust font size'**
  String get fontSizeAdjustment;

  /// Font size example text
  ///
  /// In en, this message translates to:
  /// **'Example text with current size'**
  String get fontSizeExample;

  /// Title for notifications screen
  ///
  /// In en, this message translates to:
  /// **'Notifications and Settings'**
  String get notificationsAndSettings;

  /// Message when testing sound and vibration
  ///
  /// In en, this message translates to:
  /// **'Testing sound and vibration!'**
  String get testingSoundVibration;

  /// Message when sound and vibration are disabled
  ///
  /// In en, this message translates to:
  /// **'Enable sound or vibration first!'**
  String get enableSoundVibrationFirst;

  /// Title for notification center section
  ///
  /// In en, this message translates to:
  /// **'Notification Center'**
  String get notificationCenter;

  /// Subtitle for notification center
  ///
  /// In en, this message translates to:
  /// **'Manage your notification preferences'**
  String get manageNotificationPreferences;

  /// Sound option title
  ///
  /// In en, this message translates to:
  /// **'Sound'**
  String get sound;

  /// Sound option description
  ///
  /// In en, this message translates to:
  /// **'Play notification sound'**
  String get playNotificationSound;

  /// Vibration option title
  ///
  /// In en, this message translates to:
  /// **'Vibration'**
  String get vibration;

  /// Vibration option description
  ///
  /// In en, this message translates to:
  /// **'Vibrate on notification'**
  String get vibrateOnNotification;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

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

  /// Title for essential resources page
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

  /// Welcome title in intro page
  ///
  /// In en, this message translates to:
  /// **'Welcome to Medical Emergency'**
  String get welcomeToMedicalEmergency;

  /// Description text in intro page
  ///
  /// In en, this message translates to:
  /// **'Your complete guide for medical emergency situations'**
  String get emergencyGuideDescription;

  /// Title for emergency procedures page
  ///
  /// In en, this message translates to:
  /// **'Emergency Procedures'**
  String get emergencyProceduresTitle;

  /// Title for cardiac procedures
  ///
  /// In en, this message translates to:
  /// **'Cardiac System'**
  String get cardiacSystem;

  /// Description for cardiac procedures
  ///
  /// In en, this message translates to:
  /// **'Learn about CPR and other cardiac procedures'**
  String get cardiacDescription;

  /// Title for respiratory procedures
  ///
  /// In en, this message translates to:
  /// **'Respiratory System'**
  String get respiratorySystem;

  /// Description for respiratory procedures
  ///
  /// In en, this message translates to:
  /// **'Ventilation and clearance techniques'**
  String get respiratoryDescription;

  /// Title for allergy procedures
  ///
  /// In en, this message translates to:
  /// **'Allergic Reaction'**
  String get allergicReaction;

  /// Description for allergy procedures
  ///
  /// In en, this message translates to:
  /// **'Protocols for anaphylaxis and severe allergies'**
  String get allergyDescription;

  /// Title for consciousness procedures
  ///
  /// In en, this message translates to:
  /// **'Consciousness Alteration'**
  String get consciousnessAlteration;

  /// Description for consciousness procedures
  ///
  /// In en, this message translates to:
  /// **'Management of unconscious patients'**
  String get consciousnessDescription;

  /// Title for emergency contacts
  ///
  /// In en, this message translates to:
  /// **'Emergency Contacts'**
  String get emergencyContacts;

  /// Title for emergency kit
  ///
  /// In en, this message translates to:
  /// **'Emergency Kit'**
  String get emergencyKit;

  /// Title for basic life support
  ///
  /// In en, this message translates to:
  /// **'Basic Life Support'**
  String get basicLifeSupport;

  /// Title for essential medications
  ///
  /// In en, this message translates to:
  /// **'Essential Medications'**
  String get essentialMedications;

  /// Description for quick access to resources
  ///
  /// In en, this message translates to:
  /// **'Quickly access important resources for emergency situations'**
  String get quickAccessDescription;

  /// Title for account section
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// Title for support section
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// Title for information section
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get information;

  /// Title for profile settings
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Title for the contact us screen
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// Title for the feedback screen
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedback;

  /// Title for app information
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get appInfo;

  /// Title for references section
  ///
  /// In en, this message translates to:
  /// **'References'**
  String get references;

  /// Title for logout button
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Subtitle for editing personal information
  ///
  /// In en, this message translates to:
  /// **'Edit personal information'**
  String get editProfile;

  /// Subtitle for contact us option
  ///
  /// In en, this message translates to:
  /// **'Talk to our team'**
  String get contactUsSubtitle;

  /// Subtitle for feedback option
  ///
  /// In en, this message translates to:
  /// **'Rate our app'**
  String get feedbackSubtitle;

  /// Subtitle for app information
  ///
  /// In en, this message translates to:
  /// **'Version and information'**
  String get appInfoSubtitle;

  /// Subtitle for references section
  ///
  /// In en, this message translates to:
  /// **'Sources and bibliography'**
  String get referencesSubtitle;

  /// Title for the profile screen
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// Title for editing the user's name
  ///
  /// In en, this message translates to:
  /// **'Edit Name'**
  String get editName;

  /// Message when the name is updated
  ///
  /// In en, this message translates to:
  /// **'Name updated!'**
  String get updateName;

  /// Title for the specialty field
  ///
  /// In en, this message translates to:
  /// **'Specialty'**
  String get specialty;

  /// Message when the specialty is updated
  ///
  /// In en, this message translates to:
  /// **'Specialty updated!'**
  String get updateSpecialty;

  /// Title for changing the password
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// Message when the password is updated
  ///
  /// In en, this message translates to:
  /// **'Password updated!'**
  String get updatePassword;

  /// Title for updating the profile picture
  ///
  /// In en, this message translates to:
  /// **'Update Profile Picture'**
  String get updateProfilePicture;

  /// Option to choose an image from the gallery
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get chooseFromGallery;

  /// Option to take a new photo
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// Label for current password field
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// Label for new password field
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// Label for confirming new password
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// Error message when passwords do not match
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// Label for the email field
  ///
  /// In en, this message translates to:
  /// **'Your Email'**
  String get yourEmail;

  /// Label for the message field
  ///
  /// In en, this message translates to:
  /// **'Your Message'**
  String get yourMessage;

  /// Button text for sending the message
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessage;

  /// Message displayed when the message is sent successfully
  ///
  /// In en, this message translates to:
  /// **'Message sent successfully!'**
  String get messageSent;

  /// Message displayed when there is an error sending the message
  ///
  /// In en, this message translates to:
  /// **'Error sending message. Please try again.'**
  String get messageSendError;

  /// Message displayed when the message field is empty
  ///
  /// In en, this message translates to:
  /// **'Please enter a message.'**
  String get emptyMessage;

  /// Header text for the help section
  ///
  /// In en, this message translates to:
  /// **'How can we help?'**
  String get howCanWeHelp;

  /// Text indicating the response time
  ///
  /// In en, this message translates to:
  /// **'Our team will respond within 24 hours.'**
  String get responseTime;

  /// Hint text for the message input field
  ///
  /// In en, this message translates to:
  /// **'Type your message here...'**
  String get hintMessage;

  /// Message displayed when feedback field is empty
  ///
  /// In en, this message translates to:
  /// **'Please write your feedback.'**
  String get emptyFeedback;

  /// Message displayed when feedback is successfully sent
  ///
  /// In en, this message translates to:
  /// **'Feedback sent! Thank you!'**
  String get feedbackSent;

  /// Message displayed when there is an error sending feedback
  ///
  /// In en, this message translates to:
  /// **'Error sending feedback: {error}'**
  String errorSendingFeedback(Object error);

  /// Header text for the feedback section
  ///
  /// In en, this message translates to:
  /// **'Your opinion is very important!'**
  String get yourOpinionIsImportant;

  /// Subheader text for the feedback section
  ///
  /// In en, this message translates to:
  /// **'Help us improve our app'**
  String get helpUsImprove;

  /// Label for the comment section
  ///
  /// In en, this message translates to:
  /// **'Leave your comment:'**
  String get leaveYourComment;

  /// Label for the rating section
  ///
  /// In en, this message translates to:
  /// **'Rating:'**
  String get rating;

  /// Button text for sending feedback
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get sendFeedback;

  /// Hint text for the comment input field
  ///
  /// In en, this message translates to:
  /// **'Write your comments here'**
  String get writeYourComments;

  /// Title for the app information screen
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get appInfoTitle;

  /// Section title for about the app
  ///
  /// In en, this message translates to:
  /// **'About the App'**
  String get aboutApp;

  /// Description of the app
  ///
  /// In en, this message translates to:
  /// **'An app to assist in medical emergency situations'**
  String get description;

  /// Section title for contact information
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInfo;

  /// Label for email contact
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Label for website contact
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// Section title for developers
  ///
  /// In en, this message translates to:
  /// **'Developers'**
  String get developers;

  /// Label for the development team
  ///
  /// In en, this message translates to:
  /// **'Team'**
  String get team;

  /// Label for technologies used
  ///
  /// In en, this message translates to:
  /// **'Technologies'**
  String get technologies;

  /// Title for terms of use
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// Title for privacy policy
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// App version
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0'**
  String get version;

  /// Content for the Terms of Use screen in English
  ///
  /// In en, this message translates to:
  /// **'Terms of Use for Medical Emergency\n\nThis document establishes the terms and conditions for the use of the application:\n\n1. Acceptance of Terms\n   By using this application, you automatically agree to these terms of use.\n\n2. Use of the Application\n   This application is intended for informational purposes only and does not replace professional medical consultation.\n\n3. Responsibilities\n   We are not responsible for decisions made based on the information provided by the application.\n\n4. Privacy\n   We respect your privacy in accordance with our privacy policy.\n\n5. Modifications\n   We reserve the right to modify these terms at any time without prior notice.'**
  String get termsOfUseContent;

  /// Content for the Privacy Policy screen in English
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy for Medical Emergency\n\nThis document explains how we handle your information:\n\n1. Data Collection\n   We only collect data that is strictly necessary for the operation of the application.\n\n2. Use of Data\n   Your information is used solely to enhance your experience with the app.\n\n3. Data Protection\n   We implement robust security measures to protect your personal data.\n\n4. Sharing\n   We do not share your information with third parties without your express consent.\n\n5. Your Rights\n   You have the full right to access, correct, or request the deletion of your data.'**
  String get privacyPolicyContent;

  /// Title of the application in English
  ///
  /// In en, this message translates to:
  /// **'Medical Emergency'**
  String get appTitle;

  /// Label for Fear/Anxiety screen in English
  ///
  /// In en, this message translates to:
  /// **'Fear/Anxiety'**
  String get fearAnxiety;

  /// Label for Medications screen in English
  ///
  /// In en, this message translates to:
  /// **'Medications'**
  String get medications;

  /// Label for Emergency Equipment screen in English
  ///
  /// In en, this message translates to:
  /// **'Emergency Equipment'**
  String get emergencyEquipment;

  /// Label for SBV screen in English
  ///
  /// In en, this message translates to:
  /// **'SBV'**
  String get sbv;

  /// Label for Medical Emergencies screen in English
  ///
  /// In en, this message translates to:
  /// **'Medical Emergencies'**
  String get medicalEmergencies;

  /// Label for Favorite section in English
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// Label for General Practitioner specialty in English
  ///
  /// In en, this message translates to:
  /// **'General Practitioner'**
  String get specialtyGeneralPractitioner;

  /// Label for Orthodontist specialty in English
  ///
  /// In en, this message translates to:
  /// **'Orthodontist'**
  String get specialtyOrthodontist;

  /// Label for Endodontist specialty in English
  ///
  /// In en, this message translates to:
  /// **'Endodontist'**
  String get specialtyEndodontist;

  /// Label for Pediatric Dentist specialty in English
  ///
  /// In en, this message translates to:
  /// **'Pediatric Dentist'**
  String get specialtyPediatricDentist;

  /// Label for Surgeon specialty in English
  ///
  /// In en, this message translates to:
  /// **'Surgeon'**
  String get specialtySurgeon;

  /// Label for Prosthetist specialty in English
  ///
  /// In en, this message translates to:
  /// **'Prosthetist'**
  String get specialtyProsthetist;

  /// Label for Periodontist specialty in English
  ///
  /// In en, this message translates to:
  /// **'Periodontist'**
  String get specialtyPeriodontist;

  /// Label for undefined specialty in English
  ///
  /// In en, this message translates to:
  /// **'Undefined'**
  String get specialtyUndefined;
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

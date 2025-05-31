import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

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
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @devname.
  ///
  /// In en, this message translates to:
  /// **'Sean Paul Shamia'**
  String get devname;

  /// No description provided for @workdesc.
  ///
  /// In en, this message translates to:
  /// **'Mobile App Developer'**
  String get workdesc;

  /// No description provided for @mobileAppDeveloperDesc.
  ///
  /// In en, this message translates to:
  /// **'Passionate about creating innovative and user-friendly mobile applications'**
  String get mobileAppDeveloperDesc;

  /// No description provided for @downloadCV.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get downloadCV;

  /// No description provided for @poweredByFlutter.
  ///
  /// In en, this message translates to:
  /// **'Powered by Flutter'**
  String get poweredByFlutter;

  /// No description provided for @experiences.
  ///
  /// In en, this message translates to:
  /// **'Experiences'**
  String get experiences;

  /// No description provided for @projectsDescription.
  ///
  /// In en, this message translates to:
  /// **'KasaPay is a mobile app that allows users to send and receive money easily and securely. The app is designed to be user-friendly and intuitive, making it easy for anyone to use. With Kasapay, users can send money to friends and family, pay bills, and make purchases online. The app also includes features such as transaction history, account management, and customer support.'**
  String get projectsDescription;

  /// No description provided for @experienceDescription.
  ///
  /// In en, this message translates to:
  /// **' I am currently working on store app for Kasapay and there mobile App and as Customer support, I do test runs and ensure the Remitcore System works efficiently, I am proficient in Flutter, Dart, and Java.'**
  String get experienceDescription;

  /// No description provided for @testimonies.
  ///
  /// In en, this message translates to:
  /// **'Testimonies'**
  String get testimonies;

  /// No description provided for @testimoniesDescription.
  ///
  /// In en, this message translates to:
  /// **'What others say about my work'**
  String get testimoniesDescription;

  /// No description provided for @contactPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Get in Touch'**
  String get contactPageTitle;

  /// No description provided for @contactPageDescription.
  ///
  /// In en, this message translates to:
  /// **'Feel free to reach out to me for any questions, collaborations, or opportunities. I\'m always excited to connect with fellow developers and potential clients.These are my contact details: +254 795 684 258 or email me at seanzuri12@gmail.com'**
  String get contactPageDescription;
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
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

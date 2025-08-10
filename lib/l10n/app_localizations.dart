import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
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
    Locale('bn'),
    Locale('en')
  ];

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @loginToContinue.
  ///
  /// In en, this message translates to:
  /// **'Login to continue'**
  String get loginToContinue;

  /// No description provided for @emailOrPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Email/Phone Number'**
  String get emailOrPhoneNumber;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enterPassword;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember Me'**
  String get rememberMe;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @forgotPassword_.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword_;

  /// No description provided for @orRegisterWithSocialAccounts.
  ///
  /// In en, this message translates to:
  /// **'Or register with social accounts'**
  String get orRegisterWithSocialAccounts;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @anAccount.
  ///
  /// In en, this message translates to:
  /// **'an Account'**
  String get anAccount;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @byContinuingYouAgreeToOur.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to'**
  String get byContinuingYouAgreeToOur;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsAndConditions;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sendCode;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @enterTheCodeWhichWasSentToYourEmailOrPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter the code which was sent to your Email/Phone Number'**
  String get enterTheCodeWhichWasSentToYourEmailOrPhoneNumber;

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter Code'**
  String get enterCode;

  /// No description provided for @dontReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code?'**
  String get dontReceiveCode;

  /// No description provided for @resendNow.
  ///
  /// In en, this message translates to:
  /// **'Resend Now'**
  String get resendNow;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @createNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create New Password'**
  String get createNewPassword;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @onboardingTitle.
  ///
  /// In en, this message translates to:
  /// **'Comprehensive Livestock and Veterinary Management'**
  String get onboardingTitle;

  /// No description provided for @onboardingDetails.
  ///
  /// In en, this message translates to:
  /// **'VetTrack offers streamlined livestock management, encompassing health monitoring and record maintenance for optimal care'**
  String get onboardingDetails;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Revolutionizing Livestock Trade'**
  String get onboardingTitle2;

  /// No description provided for @onboardingDetails2.
  ///
  /// In en, this message translates to:
  /// **'Discover, a revolutionary approach to livestock management through VetTrack\'s seamless Buy & Sell option, enhancing efficiency and profitability.'**
  String get onboardingDetails2;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter Bloc Localization'**
  String get appTitle;

  /// No description provided for @changeTheme.
  ///
  /// In en, this message translates to:
  /// **'Change Theme'**
  String get changeTheme;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Create \nan Account'**
  String get createAnAccount;

  /// No description provided for @createAccountInstruction.
  ///
  /// In en, this message translates to:
  /// **'Create an account easily with your information'**
  String get createAccountInstruction;

  /// No description provided for @setANewPassword.
  ///
  /// In en, this message translates to:
  /// **'Set a New Password'**
  String get setANewPassword;

  /// No description provided for @forgotPasswordInstruction.
  ///
  /// In en, this message translates to:
  /// **'Provide your email or phone to reset your password.'**
  String get forgotPasswordInstruction;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning!'**
  String get goodMorning;

  /// No description provided for @staticPhonNumber.
  ///
  /// In en, this message translates to:
  /// **'+8801234567890'**
  String get staticPhonNumber;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @finance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get finance;

  /// No description provided for @barn.
  ///
  /// In en, this message translates to:
  /// **'Barn'**
  String get barn;

  /// No description provided for @market.
  ///
  /// In en, this message translates to:
  /// **'Market'**
  String get market;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @vetNearMe.
  ///
  /// In en, this message translates to:
  /// **'Vet Near Me'**
  String get vetNearMe;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @pushNotifications.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get pushNotifications;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @featuresRequest.
  ///
  /// In en, this message translates to:
  /// **'Feature Request'**
  String get featuresRequest;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @requestDataReport.
  ///
  /// In en, this message translates to:
  /// **'Request Data Report'**
  String get requestDataReport;

  /// No description provided for @reportBug.
  ///
  /// In en, this message translates to:
  /// **'Report a Bug'**
  String get reportBug;

  /// No description provided for @bangla.
  ///
  /// In en, this message translates to:
  /// **'Bangla'**
  String get bangla;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @selectYourLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Your Language'**
  String get selectYourLanguage;

  /// No description provided for @selectYourTheme.
  ///
  /// In en, this message translates to:
  /// **'Select Your Theme'**
  String get selectYourTheme;

  /// No description provided for @milkYield.
  ///
  /// In en, this message translates to:
  /// **'Milk Yield'**
  String get milkYield;

  /// No description provided for @lastWeak.
  ///
  /// In en, this message translates to:
  /// **'Last Week'**
  String get lastWeak;

  /// No description provided for @buffalo.
  ///
  /// In en, this message translates to:
  /// **'Buffalo'**
  String get buffalo;

  /// No description provided for @cattle.
  ///
  /// In en, this message translates to:
  /// **'Cattle'**
  String get cattle;

  /// No description provided for @goat.
  ///
  /// In en, this message translates to:
  /// **'Goat'**
  String get goat;

  /// No description provided for @chicken.
  ///
  /// In en, this message translates to:
  /// **'Chicken'**
  String get chicken;

  /// No description provided for @sick.
  ///
  /// In en, this message translates to:
  /// **'Sick'**
  String get sick;

  /// No description provided for @vaccinated.
  ///
  /// In en, this message translates to:
  /// **'Vaccinated'**
  String get vaccinated;

  /// No description provided for @pregnant.
  ///
  /// In en, this message translates to:
  /// **'Pregnant'**
  String get pregnant;

  /// No description provided for @eggReport.
  ///
  /// In en, this message translates to:
  /// **'Egg Report'**
  String get eggReport;

  /// No description provided for @feedSummary.
  ///
  /// In en, this message translates to:
  /// **'Feed Summary'**
  String get feedSummary;

  /// No description provided for @financeSummary.
  ///
  /// In en, this message translates to:
  /// **'Finance Summary'**
  String get financeSummary;

  /// No description provided for @expense.
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get expense;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get income;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @transactionHistory.
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get transactionHistory;

  /// No description provided for @totalAnimalsInBarn.
  ///
  /// In en, this message translates to:
  /// **'Total Animals\nin the Barn'**
  String get totalAnimalsInBarn;

  /// No description provided for @inMilk.
  ///
  /// In en, this message translates to:
  /// **'InMilk'**
  String get inMilk;

  /// No description provided for @dry.
  ///
  /// In en, this message translates to:
  /// **'Dry'**
  String get dry;

  /// No description provided for @milkCapacity.
  ///
  /// In en, this message translates to:
  /// **'Milk Capacity'**
  String get milkCapacity;

  /// No description provided for @vaccination.
  ///
  /// In en, this message translates to:
  /// **'Vaccination'**
  String get vaccination;

  /// No description provided for @lastVaccineDate.
  ///
  /// In en, this message translates to:
  /// **'Last Vaccine Date'**
  String get lastVaccineDate;

  /// No description provided for @feed.
  ///
  /// In en, this message translates to:
  /// **'Feed'**
  String get feed;

  /// No description provided for @lactation.
  ///
  /// In en, this message translates to:
  /// **'Lactation'**
  String get lactation;

  /// No description provided for @owner.
  ///
  /// In en, this message translates to:
  /// **'Owner'**
  String get owner;

  /// No description provided for @animalMarket.
  ///
  /// In en, this message translates to:
  /// **'Animal Market'**
  String get animalMarket;

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'2 hours ago'**
  String get hoursAgo;

  /// No description provided for @dummyDate.
  ///
  /// In en, this message translates to:
  /// **'April 1, 2023'**
  String get dummyDate;

  /// No description provided for @dummyTime.
  ///
  /// In en, this message translates to:
  /// **'10:00 AM'**
  String get dummyTime;

  /// No description provided for @ltr.
  ///
  /// In en, this message translates to:
  /// **'Ltr'**
  String get ltr;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'Kg'**
  String get kg;

  /// No description provided for @buffaloMilk.
  ///
  /// In en, this message translates to:
  /// **'Buffalo Milk'**
  String get buffaloMilk;

  /// No description provided for @cattleMilk.
  ///
  /// In en, this message translates to:
  /// **'Cattle Milk'**
  String get cattleMilk;

  /// No description provided for @goatMilk.
  ///
  /// In en, this message translates to:
  /// **'Goat Milk'**
  String get goatMilk;

  /// No description provided for @greenFodder.
  ///
  /// In en, this message translates to:
  /// **'Green Fodder'**
  String get greenFodder;

  /// No description provided for @dryFodder.
  ///
  /// In en, this message translates to:
  /// **'Dry Fodder'**
  String get dryFodder;

  /// No description provided for @concentrate.
  ///
  /// In en, this message translates to:
  /// **'Concentrate'**
  String get concentrate;

  /// No description provided for @medicines.
  ///
  /// In en, this message translates to:
  /// **'Medicines'**
  String get medicines;

  /// No description provided for @eggs.
  ///
  /// In en, this message translates to:
  /// **'Eggs'**
  String get eggs;

  /// No description provided for @kamalKumar.
  ///
  /// In en, this message translates to:
  /// **'Kamal Kumar'**
  String get kamalKumar;

  /// No description provided for @murrahCrossBuffalo.
  ///
  /// In en, this message translates to:
  /// **'Murrah Cross Buffalo'**
  String get murrahCrossBuffalo;

  /// No description provided for @addressMarket.
  ///
  /// In en, this message translates to:
  /// **'Dhaka, Bangladesh'**
  String get addressMarket;

  /// No description provided for @murrahCross.
  ///
  /// In en, this message translates to:
  /// **'Murrah Cross'**
  String get murrahCross;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @jersey.
  ///
  /// In en, this message translates to:
  /// **'Jersey'**
  String get jersey;

  /// No description provided for @sahiwal.
  ///
  /// In en, this message translates to:
  /// **'Sahiwal'**
  String get sahiwal;

  /// No description provided for @redSahiwal.
  ///
  /// In en, this message translates to:
  /// **'Red Sahiwal'**
  String get redSahiwal;

  /// No description provided for @redSindhi.
  ///
  /// In en, this message translates to:
  /// **'Red Sindhi'**
  String get redSindhi;

  /// No description provided for @noOfGoats.
  ///
  /// In en, this message translates to:
  /// **'No. of Goats'**
  String get noOfGoats;

  /// No description provided for @noOfBirds.
  ///
  /// In en, this message translates to:
  /// **'No. of Birds'**
  String get noOfBirds;

  /// No description provided for @eggProductionPerBird.
  ///
  /// In en, this message translates to:
  /// **'Egg Production Per Bird'**
  String get eggProductionPerBird;

  /// No description provided for @deshi.
  ///
  /// In en, this message translates to:
  /// **'Deshi'**
  String get deshi;

  /// No description provided for @broiler.
  ///
  /// In en, this message translates to:
  /// **'Broiler'**
  String get broiler;

  /// No description provided for @layer.
  ///
  /// In en, this message translates to:
  /// **'Layer'**
  String get layer;

  /// No description provided for @blackBengal.
  ///
  /// In en, this message translates to:
  /// **'Black Bengal'**
  String get blackBengal;

  /// No description provided for @jamunapari.
  ///
  /// In en, this message translates to:
  /// **'Jamunapari'**
  String get jamunapari;

  /// No description provided for @mixedFeed.
  ///
  /// In en, this message translates to:
  /// **'Mixed Feed'**
  String get mixedFeed;

  /// No description provided for @corn.
  ///
  /// In en, this message translates to:
  /// **'Corn'**
  String get corn;

  /// No description provided for @tagNo.
  ///
  /// In en, this message translates to:
  /// **'Tag No.'**
  String get tagNo;

  /// No description provided for @mobileNo.
  ///
  /// In en, this message translates to:
  /// **'Mobile No.'**
  String get mobileNo;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get others;

  /// No description provided for @addMember.
  ///
  /// In en, this message translates to:
  /// **'Add Member'**
  String get addMember;

  /// No description provided for @liveStockType.
  ///
  /// In en, this message translates to:
  /// **'Livestock Type'**
  String get liveStockType;

  /// No description provided for @breed.
  ///
  /// In en, this message translates to:
  /// **'Breed'**
  String get breed;

  /// No description provided for @raisedFor.
  ///
  /// In en, this message translates to:
  /// **'Raised For'**
  String get raisedFor;

  /// No description provided for @totalAnimals.
  ///
  /// In en, this message translates to:
  /// **'Total Animals'**
  String get totalAnimals;

  /// No description provided for @recordDate.
  ///
  /// In en, this message translates to:
  /// **'Record Date'**
  String get recordDate;

  /// No description provided for @iWantToRecordFlock.
  ///
  /// In en, this message translates to:
  /// **'I want to record flock member individually'**
  String get iWantToRecordFlock;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @addTransaction.
  ///
  /// In en, this message translates to:
  /// **'Add Transaction'**
  String get addTransaction;

  /// No description provided for @selectTransactionType.
  ///
  /// In en, this message translates to:
  /// **'Select Transaction Type'**
  String get selectTransactionType;

  /// No description provided for @selectHerd.
  ///
  /// In en, this message translates to:
  /// **'Select Herd'**
  String get selectHerd;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @addDailyData.
  ///
  /// In en, this message translates to:
  /// **'Add Daily Data'**
  String get addDailyData;

  /// No description provided for @dataType.
  ///
  /// In en, this message translates to:
  /// **'Data Type'**
  String get dataType;

  /// No description provided for @feedConsumed.
  ///
  /// In en, this message translates to:
  /// **'Feed Consumed'**
  String get feedConsumed;

  /// No description provided for @mildConsumed.
  ///
  /// In en, this message translates to:
  /// **'Milk Consumed'**
  String get mildConsumed;

  /// No description provided for @eggsCollected.
  ///
  /// In en, this message translates to:
  /// **'Eggs Collected'**
  String get eggsCollected;

  /// No description provided for @incomeExpenseCategory.
  ///
  /// In en, this message translates to:
  /// **'Income/Expense Category'**
  String get incomeExpenseCategory;

  /// No description provided for @dailyCollectionType.
  ///
  /// In en, this message translates to:
  /// **'Daily Collection Type'**
  String get dailyCollectionType;

  /// No description provided for @cow.
  ///
  /// In en, this message translates to:
  /// **'Cow'**
  String get cow;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn': return AppLocalizationsBn();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

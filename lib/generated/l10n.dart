// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get homeButton {
    return Intl.message(
      'Home',
      name: 'homeButton',
      desc: '',
      args: [],
    );
  }

  /// `Muba TV`
  String get tvButton {
    return Intl.message(
      'Muba TV',
      name: 'tvButton',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsButton {
    return Intl.message(
      'Settings',
      name: 'settingsButton',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get languageButton {
    return Intl.message(
      'Language',
      name: 'languageButton',
      desc: '',
      args: [],
    );
  }

  /// `Login or Register`
  String get loginRegister {
    return Intl.message(
      'Login or Register',
      name: 'loginRegister',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logoutButton {
    return Intl.message(
      'Logout',
      name: 'logoutButton',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Cooperation Guide`
  String get guide {
    return Intl.message(
      'Cooperation Guide',
      name: 'guide',
      desc: '',
      args: [],
    );
  }

  /// `Cooperation Service`
  String get service {
    return Intl.message(
      'Cooperation Service',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Contact Center`
  String get kontak {
    return Intl.message(
      'Contact Center',
      name: 'kontak',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get information {
    return Intl.message(
      'News',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Domestic Cooperation`
  String get domestic {
    return Intl.message(
      'Domestic Cooperation',
      name: 'domestic',
      desc: '',
      args: [],
    );
  }

  /// `International Cooperation`
  String get international {
    return Intl.message(
      'International Cooperation',
      name: 'international',
      desc: '',
      args: [],
    );
  }

  /// `Cooperation Opportunity`
  String get opportunity {
    return Intl.message(
      'Cooperation Opportunity',
      name: 'opportunity',
      desc: '',
      args: [],
    );
  }

  /// `Cooperation Program`
  String get program {
    return Intl.message(
      'Cooperation Program',
      name: 'program',
      desc: '',
      args: [],
    );
  }

  /// `Cooperation Report`
  String get report {
    return Intl.message(
      'Cooperation Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `Already Registered ? `
  String get registered {
    return Intl.message(
      'Already Registered ? ',
      name: 'registered',
      desc: '',
      args: [],
    );
  }

  /// `Back to Login`
  String get registeredBack {
    return Intl.message(
      'Back to Login',
      name: 'registeredBack',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerButton {
    return Intl.message(
      'Register',
      name: 'registerButton',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the Terms and Privacy Policy from BKSD Kab. Muba service`
  String get agreeCheck {
    return Intl.message(
      'I agree to the Terms and Privacy Policy from BKSD Kab. Muba service',
      name: 'agreeCheck',
      desc: '',
      args: [],
    );
  }

  /// `Register BKSD Kab. Muba`
  String get registerTitle {
    return Intl.message(
      'Register BKSD Kab. Muba',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Data not complete, please check again`
  String get registerCheck {
    return Intl.message(
      'Data not complete, please check again',
      name: 'registerCheck',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get completeName {
    return Intl.message(
      'Full Name',
      name: 'completeName',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPass {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPass',
      desc: '',
      args: [],
    );
  }

  /// `Please Wait`
  String get pleaseWait {
    return Intl.message(
      'Please Wait',
      name: 'pleaseWait',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get sendForgot {
    return Intl.message(
      'Send',
      name: 'sendForgot',
      desc: '',
      args: [],
    );
  }

  /// `Failed to login! User not found!`
  String get loginFailed {
    return Intl.message(
      'Failed to login! User not found!',
      name: 'loginFailed',
      desc: '',
      args: [],
    );
  }

  /// `Please login first`
  String get pleaseLogin {
    return Intl.message(
      'Please login first',
      name: 'pleaseLogin',
      desc: '',
      args: [],
    );
  }

  /// `General Settings`
  String get generalSettings {
    return Intl.message(
      'General Settings',
      name: 'generalSettings',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get about {
    return Intl.message(
      'About App',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Please select a platform to reach Contact Center`
  String get selectPlatform {
    return Intl.message(
      'Please select a platform to reach Contact Center',
      name: 'selectPlatform',
      desc: '',
      args: [],
    );
  }

  /// `Select Platform`
  String get platformCard {
    return Intl.message(
      'Select Platform',
      name: 'platformCard',
      desc: '',
      args: [],
    );
  }

  /// `File ID`
  String get fileID {
    return Intl.message(
      'File ID',
      name: 'fileID',
      desc: '',
      args: [],
    );
  }

  /// `REGISTERED AS A MEMBER`
  String get registeredMember {
    return Intl.message(
      'REGISTERED AS A MEMBER',
      name: 'registeredMember',
      desc: '',
      args: [],
    );
  }

  /// `Uploaded Files`
  String get uploadedFiles {
    return Intl.message(
      'Uploaded Files',
      name: 'uploadedFiles',
      desc: '',
      args: [],
    );
  }

  /// `Re-upload`
  String get reUpload {
    return Intl.message(
      'Re-upload',
      name: 'reUpload',
      desc: '',
      args: [],
    );
  }

  /// `LOOK AT FILES`
  String get lookFiles {
    return Intl.message(
      'LOOK AT FILES',
      name: 'lookFiles',
      desc: '',
      args: [],
    );
  }

  /// `UPLOAD FILES`
  String get uploadFiles {
    return Intl.message(
      'UPLOAD FILES',
      name: 'uploadFiles',
      desc: '',
      args: [],
    );
  }

  /// `FILES HAVE BEEN VERIFIED`
  String get verifyFiles {
    return Intl.message(
      'FILES HAVE BEEN VERIFIED',
      name: 'verifyFiles',
      desc: '',
      args: [],
    );
  }

  /// `Domestic`
  String get dalamNegeri {
    return Intl.message(
      'Domestic',
      name: 'dalamNegeri',
      desc: '',
      args: [],
    );
  }

  /// `International`
  String get luarNegeri {
    return Intl.message(
      'International',
      name: 'luarNegeri',
      desc: '',
      args: [],
    );
  }

  /// `Preparation Step`
  String get prepPhase {
    return Intl.message(
      'Preparation Step',
      name: 'prepPhase',
      desc: '',
      args: [],
    );
  }

  /// `Offering Step`
  String get offerPhase {
    return Intl.message(
      'Offering Step',
      name: 'offerPhase',
      desc: '',
      args: [],
    );
  }

  /// `Organizing Step`
  String get susunPhase {
    return Intl.message(
      'Organizing Step',
      name: 'susunPhase',
      desc: '',
      args: [],
    );
  }

  /// `Reviewing Step`
  String get reviewPhase {
    return Intl.message(
      'Reviewing Step',
      name: 'reviewPhase',
      desc: '',
      args: [],
    );
  }

  /// `Signing Step`
  String get signPhase {
    return Intl.message(
      'Signing Step',
      name: 'signPhase',
      desc: '',
      args: [],
    );
  }

  /// `Agreement Step`
  String get agreePhase {
    return Intl.message(
      'Agreement Step',
      name: 'agreePhase',
      desc: '',
      args: [],
    );
  }

  /// `Execution Step`
  String get executePhase {
    return Intl.message(
      'Execution Step',
      name: 'executePhase',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get dialogTitle {
    return Intl.message(
      'Confirmation',
      name: 'dialogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Requirements`
  String get dialogTitleP {
    return Intl.message(
      'Requirements',
      name: 'dialogTitleP',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to download this file:`
  String get dialogContent {
    return Intl.message(
      'Are you sure to download this file:',
      name: 'dialogContent',
      desc: '',
      args: [],
    );
  }

  /// `DOWNLOAD`
  String get dialogConfirm {
    return Intl.message(
      'DOWNLOAD',
      name: 'dialogConfirm',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL`
  String get dialogCancel {
    return Intl.message(
      'CANCEL',
      name: 'dialogCancel',
      desc: '',
      args: [],
    );
  }

  /// `Facilitate`
  String get facilitation {
    return Intl.message(
      'Facilitate',
      name: 'facilitation',
      desc: '',
      args: [],
    );
  }

  /// `Cooperation`
  String get coop {
    return Intl.message(
      'Cooperation',
      name: 'coop',
      desc: '',
      args: [],
    );
  }

  /// `Regional Cooperation`
  String get ksdd {
    return Intl.message(
      'Regional Cooperation',
      name: 'ksdd',
      desc: '',
      args: [],
    );
  }

  /// `Regional Cooperation with Third Parties`
  String get ksdpk {
    return Intl.message(
      'Regional Cooperation with Third Parties',
      name: 'ksdpk',
      desc: '',
      args: [],
    );
  }

  /// `Synergy between Central Government and Local Governments`
  String get sinergi {
    return Intl.message(
      'Synergy between Central Government and Local Governments',
      name: 'sinergi',
      desc: '',
      args: [],
    );
  }

  /// `Regional Cooperation with Foreign Local Governments`
  String get ksdpl {
    return Intl.message(
      'Regional Cooperation with Foreign Local Governments',
      name: 'ksdpl',
      desc: '',
      args: [],
    );
  }

  /// `Regional Cooperation with Foreign Institutions`
  String get ksdll {
    return Intl.message(
      'Regional Cooperation with Foreign Institutions',
      name: 'ksdll',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get health {
    return Intl.message(
      'Health',
      name: 'health',
      desc: '',
      args: [],
    );
  }

  /// `Tourism`
  String get tourism {
    return Intl.message(
      'Tourism',
      name: 'tourism',
      desc: '',
      args: [],
    );
  }

  /// `Sport`
  String get sport {
    return Intl.message(
      'Sport',
      name: 'sport',
      desc: '',
      args: [],
    );
  }

  /// `SUCCESS`
  String get suksesForm {
    return Intl.message(
      'SUCCESS',
      name: 'suksesForm',
      desc: '',
      args: [],
    );
  }

  /// `FILLING OUT THE FRAMEWORK OF REFERENCE`
  String get fillingSukses {
    return Intl.message(
      'FILLING OUT THE FRAMEWORK OF REFERENCE',
      name: 'fillingSukses',
      desc: '',
      args: [],
    );
  }

  /// `Back to Dashboard`
  String get backToDb {
    return Intl.message(
      'Back to Dashboard',
      name: 'backToDb',
      desc: '',
      args: [],
    );
  }

  /// `Please fill the form below`
  String get formStepT {
    return Intl.message(
      'Please fill the form below',
      name: 'formStepT',
      desc: '',
      args: [],
    );
  }

  /// `PREPARATION APPLICATION FORM`
  String get stepTitle {
    return Intl.message(
      'PREPARATION APPLICATION FORM',
      name: 'stepTitle',
      desc: '',
      args: [],
    );
  }

  /// `OFFERING APPLICATION FORM`
  String get stepTitleOffer {
    return Intl.message(
      'OFFERING APPLICATION FORM',
      name: 'stepTitleOffer',
      desc: '',
      args: [],
    );
  }

  /// `Letter Number`
  String get noLetter {
    return Intl.message(
      'Letter Number',
      name: 'noLetter',
      desc: '',
      args: [],
    );
  }

  /// `Letter Date`
  String get dateLetter {
    return Intl.message(
      'Letter Date',
      name: 'dateLetter',
      desc: '',
      args: [],
    );
  }

  /// `Hereby Submit an Offer`
  String get offerState {
    return Intl.message(
      'Hereby Submit an Offer',
      name: 'offerState',
      desc: '',
      args: [],
    );
  }

  /// `Office`
  String get office {
    return Intl.message(
      'Office',
      name: 'office',
      desc: '',
      args: [],
    );
  }

  /// `Act For and In the Name Of`
  String get actBehalf {
    return Intl.message(
      'Act For and In the Name Of',
      name: 'actBehalf',
      desc: '',
      args: [],
    );
  }

  /// `Source`
  String get source {
    return Intl.message(
      'Source',
      name: 'source',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePass {
    return Intl.message(
      'Change Password',
      name: 'changePass',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPass {
    return Intl.message(
      'New Password',
      name: 'newPass',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPass {
    return Intl.message(
      'Old Password',
      name: 'oldPass',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed!`
  String get passChanged {
    return Intl.message(
      'Password Changed!',
      name: 'passChanged',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'id'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

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

  /// `Refresh the list`
  String get pageAccueilActualiserListe {
    return Intl.message(
      'Refresh the list',
      name: 'pageAccueilActualiserListe',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get pageAccueilTitre {
    return Intl.message(
      'Home',
      name: 'pageAccueilTitre',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get pageAccueilLoading {
    return Intl.message(
      'Loading',
      name: 'pageAccueilLoading',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with google`
  String get pageConnexionConnexionGoogle {
    return Intl.message(
      'Sign in with google',
      name: 'pageConnexionConnexionGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get pageConnexionConnexion {
    return Intl.message(
      'Sign in',
      name: 'pageConnexionConnexion',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get pageConnexionInscription {
    return Intl.message(
      'Sign up',
      name: 'pageConnexionInscription',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get pageConnexionMotDePasse {
    return Intl.message(
      'Password',
      name: 'pageConnexionMotDePasse',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get pageConnexionNom {
    return Intl.message(
      'Username',
      name: 'pageConnexionNom',
      desc: '',
      args: [],
    );
  }

  /// `Connection`
  String get pageConnexionTitre {
    return Intl.message(
      'Connection',
      name: 'pageConnexionTitre',
      desc: '',
      args: [],
    );
  }

  /// `Deadline`
  String get pageConsultationEcheance {
    return Intl.message(
      'Deadline',
      name: 'pageConsultationEcheance',
      desc: '',
      args: [],
    );
  }

  /// `Edit the task`
  String get pageConsultationModifier {
    return Intl.message(
      'Edit the task',
      name: 'pageConsultationModifier',
      desc: '',
      args: [],
    );
  }

  /// `Task name`
  String get pageConsultationNomTache {
    return Intl.message(
      'Task name',
      name: 'pageConsultationNomTache',
      desc: '',
      args: [],
    );
  }

  /// `New percentage`
  String get pageConsultationNouvelleValeur {
    return Intl.message(
      'New percentage',
      name: 'pageConsultationNouvelleValeur',
      desc: '',
      args: [],
    );
  }

  /// `Percentage of completion: `
  String get pageConsultationPourcentageCompletion {
    return Intl.message(
      'Percentage of completion: ',
      name: 'pageConsultationPourcentageCompletion',
      desc: '',
      args: [],
    );
  }

  /// `Percentage of elpapsed time: `
  String get pageConsultationPourcentageTemps {
    return Intl.message(
      'Percentage of elpapsed time: ',
      name: 'pageConsultationPourcentageTemps',
      desc: '',
      args: [],
    );
  }

  /// `Consultation`
  String get pageConsultationTitre {
    return Intl.message(
      'Consultation',
      name: 'pageConsultationTitre',
      desc: '',
      args: [],
    );
  }

  /// `The image has been chosen`
  String get pageConsultationImageChoisie {
    return Intl.message(
      'The image has been chosen',
      name: 'pageConsultationImageChoisie',
      desc: '',
      args: [],
    );
  }

  /// `Change picture`
  String get pageConsultationChangerImage {
    return Intl.message(
      'Change picture',
      name: 'pageConsultationChangerImage',
      desc: '',
      args: [],
    );
  }

  /// `Add task`
  String get pageCreationAjoutTache {
    return Intl.message(
      'Add task',
      name: 'pageCreationAjoutTache',
      desc: '',
      args: [],
    );
  }

  /// `Task name`
  String get pageCreationNomTache {
    return Intl.message(
      'Task name',
      name: 'pageCreationNomTache',
      desc: '',
      args: [],
    );
  }

  /// `Creation`
  String get pageCreationTitre {
    return Intl.message(
      'Creation',
      name: 'pageCreationTitre',
      desc: '',
      args: [],
    );
  }

  /// `Enter date`
  String get pageCreationEntrerDate {
    return Intl.message(
      'Enter date',
      name: 'pageCreationEntrerDate',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get SuppressionTache {
    return Intl.message(
      'Delete',
      name: 'SuppressionTache',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get pageInscriptionConfirmation {
    return Intl.message(
      'Confirm password',
      name: 'pageInscriptionConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Inscription`
  String get pageInscriptionTitre {
    return Intl.message(
      'Inscription',
      name: 'pageInscriptionTitre',
      desc: '',
      args: [],
    );
  }

  /// `Passwords don't match.`
  String get pageInscriptionMotDePasseDifferent {
    return Intl.message(
      'Passwords don\'t match.',
      name: 'pageInscriptionMotDePasseDifferent',
      desc: '',
      args: [],
    );
  }

  /// `This username is already taken.`
  String get UsernameAlreadyTaken {
    return Intl.message(
      'This username is already taken.',
      name: 'UsernameAlreadyTaken',
      desc: '',
      args: [],
    );
  }

  /// `The password is too short.`
  String get PasswordTooShort {
    return Intl.message(
      'The password is too short.',
      name: 'PasswordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Network error`
  String get NetworkError {
    return Intl.message(
      'Network error',
      name: 'NetworkError',
      desc: '',
      args: [],
    );
  }

  /// `Task name can't be empty`
  String get TaskErrorNameEmpty {
    return Intl.message(
      'Task name can\'t be empty',
      name: 'TaskErrorNameEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Another task already has that name.`
  String get TaskErrorNameAlreadyUsed {
    return Intl.message(
      'Another task already has that name.',
      name: 'TaskErrorNameAlreadyUsed',
      desc: '',
      args: [],
    );
  }

  /// `The deadline is already passed.`
  String get TaskErrorDeadlineAlreadyPassed {
    return Intl.message(
      'The deadline is already passed.',
      name: 'TaskErrorDeadlineAlreadyPassed',
      desc: '',
      args: [],
    );
  }

  /// `Add a task`
  String get tiroirAjoutTache {
    return Intl.message(
      'Add a task',
      name: 'tiroirAjoutTache',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get tiroirDeconnexion {
    return Intl.message(
      'Sign out',
      name: 'tiroirDeconnexion',
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
      Locale.fromSubtags(languageCode: 'fr'),
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

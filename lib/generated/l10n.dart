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

  /// `Auth in TikTok`
  String get authInTiktok {
    return Intl.message(
      'Auth in TikTok',
      name: 'authInTiktok',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get following {
    return Intl.message(
      'Following',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `Likes`
  String get likes {
    return Intl.message(
      'Likes',
      name: 'likes',
      desc: '',
      args: [],
    );
  }

  /// `Auth with Email`
  String get authWithEmail {
    return Intl.message(
      'Auth with Email',
      name: 'authWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account yet?`
  String get dontHaveAnAccountYet {
    return Intl.message(
      'Don\'t have an account yet?',
      name: 'dontHaveAnAccountYet',
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

  /// `Auth`
  String get auth {
    return Intl.message(
      'Auth',
      name: 'auth',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email`
  String get enterEmail {
    return Intl.message(
      'Enter Email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter email`
  String get pleaseEnterEmail {
    return Intl.message(
      'Please enter email',
      name: 'pleaseEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Uncorrect email`
  String get uncorrectEmail {
    return Intl.message(
      'Uncorrect email',
      name: 'uncorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter username`
  String get enterNickname {
    return Intl.message(
      'Enter username',
      name: 'enterNickname',
      desc: '',
      args: [],
    );
  }

  /// `Please enter username`
  String get pleaseEnterNickname {
    return Intl.message(
      'Please enter username',
      name: 'pleaseEnterNickname',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Repeat password`
  String get repeatPassword {
    return Intl.message(
      'Repeat password',
      name: 'repeatPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password`
  String get pleaseEnterPassword {
    return Intl.message(
      'Please enter password',
      name: 'pleaseEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password mismatch`
  String get passwordMismatch {
    return Intl.message(
      'Password mismatch',
      name: 'passwordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `registration was not successful`
  String get registrationWasNotSuccessful {
    return Intl.message(
      'registration was not successful',
      name: 'registrationWasNotSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain 6 or more characters`
  String get passwordMustContain6OrMoreCharacters {
    return Intl.message(
      'Password must contain 6 or more characters',
      name: 'passwordMustContain6OrMoreCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Upload video`
  String get uploadVideo {
    return Intl.message(
      'Upload video',
      name: 'uploadVideo',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Artist - Song`
  String get artistSong {
    return Intl.message(
      'Artist - Song',
      name: 'artistSong',
      desc: '',
      args: [],
    );
  }

  /// `Descrption - Tags`
  String get descrptionTags {
    return Intl.message(
      'Descrption - Tags',
      name: 'descrptionTags',
      desc: '',
      args: [],
    );
  }

  /// `Upload Now`
  String get uploadNow {
    return Intl.message(
      'Upload Now',
      name: 'uploadNow',
      desc: '',
      args: [],
    );
  }

  /// `Please enter song name`
  String get pleaseEnterSongName {
    return Intl.message(
      'Please enter song name',
      name: 'pleaseEnterSongName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter description`
  String get pleaseEnterDescription {
    return Intl.message(
      'Please enter description',
      name: 'pleaseEnterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Video uploaded`
  String get videoUploaded {
    return Intl.message(
      'Video uploaded',
      name: 'videoUploaded',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Tap to add bio`
  String get tapToAddBio {
    return Intl.message(
      'Tap to add bio',
      name: 'tapToAddBio',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message(
      'Follow',
      name: 'follow',
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

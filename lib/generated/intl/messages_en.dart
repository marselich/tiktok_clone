// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "auth": MessageLookupByLibrary.simpleMessage("Auth"),
        "authInTiktok": MessageLookupByLibrary.simpleMessage("Auth in TikTok"),
        "authWithEmail":
            MessageLookupByLibrary.simpleMessage("Auth with Email"),
        "dontHaveAnAccountYet":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account yet?"),
        "enterEmail": MessageLookupByLibrary.simpleMessage("Enter Email"),
        "enterNickname": MessageLookupByLibrary.simpleMessage("Enter nickname"),
        "enterPassword": MessageLookupByLibrary.simpleMessage("Enter password"),
        "followers": MessageLookupByLibrary.simpleMessage("Followers"),
        "following": MessageLookupByLibrary.simpleMessage("Following"),
        "likes": MessageLookupByLibrary.simpleMessage("Likes"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "passwordMismatch":
            MessageLookupByLibrary.simpleMessage("Password mismatch"),
        "pleaseEnterEmail":
            MessageLookupByLibrary.simpleMessage("Please enter email"),
        "pleaseEnterNickname":
            MessageLookupByLibrary.simpleMessage("Please enter nickname"),
        "pleaseEnterPassword":
            MessageLookupByLibrary.simpleMessage("Please enter password"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registrationWasNotSuccessful": MessageLookupByLibrary.simpleMessage(
            "registration was not successful"),
        "repeatPassword":
            MessageLookupByLibrary.simpleMessage("Repeat password"),
        "uncorrectEmail":
            MessageLookupByLibrary.simpleMessage("Uncorrect email")
      };
}

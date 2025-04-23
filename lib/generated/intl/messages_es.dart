// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static String m0(value) => "Cliente ${value}";

  static String m1(value) => "Detalles del pedido # ${value}";

  static String m2(value) => "Pedido # ${value}";

  static String m3(code) =>
      "Error ${code} \nSi el error persiste, contacta a soporte";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "clientValue": m0,
    "detailOrderNumber": m1,
    "noConection": MessageLookupByLibrary.simpleMessage("No conexion"),
    "ofOf": MessageLookupByLibrary.simpleMessage("de"),
    "orderNumber": m2,
    "search": MessageLookupByLibrary.simpleMessage("Buscar"),
    "serviceNotAvailable": MessageLookupByLibrary.simpleMessage(
      "Servicio no disponible",
    ),
    "weHaveAErrorContactSuport": m3,
    "welcome": MessageLookupByLibrary.simpleMessage("Bievenido"),
  };
}

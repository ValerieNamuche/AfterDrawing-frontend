import 'dart:async';

class Validators {
  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length >= 1) {
      sink.add(name);
    } else {
      sink.addError("Este campo no debe estar vacío");
    }
  });
}

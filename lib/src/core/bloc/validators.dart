import 'dart:async';

class Validators {
  final validateNameProject =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length >= 1) {
      sink.add(name);
    } else {
      sink.addError("Este campo no debe estar vacío");
    }
    if (name.length > 25) {
      sink.addError("El nombre del proyecto debe ser más corto");
    }
  });

  final validateDescriptionProject =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length >= 1) {
      sink.add(name);
    } else {
      sink.addError("Este campo no debe estar vacío");
    }
    if (name.length > 75) {
      sink.addError("La descripción del proyecto debe ser más corto");
    }
  });

  final validateNameInterface =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length >= 1) {
      sink.add(name);
    } else {
      sink.addError("Este campo no debe estar vacío");
    }

    if (name.length > 50) {
      sink.addError("El nombre de la interface debe ser más corto");
    }
  });
}

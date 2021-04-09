import 'package:cripto_app/models/cripto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CriptoProvider extends ChangeNotifier {
  // Declarar la variable / objeto
  String _exchange;

// Metodo GET
  String get exchange => _exchange;

// Metodo SET
  set exchange(String exchange) {
    _exchange = exchange;
    notifyListeners();
  }

  Cripto _cripto;

  CriptoProvider.init() {
    _exchange = 'buenbit';
    obtenerCotizacion(exchange: 'buenbit');
  }

// El metodo GET
  Cripto get devolverCripto => _cripto;

// El metodo SET
  void cambiarCripto({Cripto cripto}) {
    _cripto = cripto;
    notifyListeners(); // Notifica a todos los que escuchan
  }

  Future<Cripto> obtenerCotizacion({String exchange}) async {
    try {
      Response respuesta =
          await Dio().get("https://criptoya.com/api/$exchange/btc/ars");

      final json = respuesta.data;

      Cripto cripto = Cripto.fromJson(json);
      cambiarCripto(cripto: cripto);

      // El this es la clase CriptoProvider
      this.exchange = exchange;
    } catch (e) {
      throw 'Error';
    }
  }
}

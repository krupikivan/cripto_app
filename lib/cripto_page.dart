import 'package:cripto_app/providers/cripto_provider.dart';
import 'package:cripto_app/widgets/imagen_exchange.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cripto.dart';

class CriptoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("BITCOIN"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () =>
                        Provider.of<CriptoProvider>(context, listen: false)
                            .obtenerCotizacion(exchange: 'buenbit'),
                    child: ImagenExchange(
                      exchange: 'buenbit',
                    )),
                GestureDetector(
                    onTap: () =>
                        Provider.of<CriptoProvider>(context, listen: false)
                            .obtenerCotizacion(exchange: 'letsbit'),
                    child: ImagenExchange(exchange: 'letsbit')),
                GestureDetector(
                    onTap: () =>
                        Provider.of<CriptoProvider>(context, listen: false)
                            .obtenerCotizacion(exchange: 'decrypto'),
                    child: ImagenExchange(exchange: 'decrypto')),
                GestureDetector(
                    onTap: () =>
                        Provider.of<CriptoProvider>(context, listen: false)
                            .obtenerCotizacion(exchange: 'ripio'),
                    child: ImagenExchange(exchange: 'ripio')),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Consumer<CriptoProvider>(
                builder: (context, data, child) => Text(
                  "Exchange: ${data.exchange.toUpperCase()}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            Consumer<CriptoProvider>(
              builder: (context, data, child) => data.devolverCripto != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        '\$${data.devolverCripto.precio}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}

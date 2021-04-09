import 'package:cripto_app/providers/cripto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cripto_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CriptoProvider.init()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CriptoPage(),
      ),
    );
  }
}

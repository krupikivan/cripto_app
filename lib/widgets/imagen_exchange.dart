import 'package:flutter/material.dart';

class ImagenExchange extends StatelessWidget {
  const ImagenExchange({Key key, this.exchange}) : super(key: key);
  final String exchange;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Container(
          width: 190.0,
          height: 190.0,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage('assets/$exchange.png'))),
        ));
  }
}

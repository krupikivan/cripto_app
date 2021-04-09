class Cripto {
  final double precio;

  Cripto({this.precio});

  factory Cripto.fromJson(Map<String, dynamic> json) => Cripto(
        precio: json['ask'] + .0,
      );
}

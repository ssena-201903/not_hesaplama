import 'package:flutter/material.dart';
import 'package:not_hesaplama/constants/sabitler.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster({
    super.key,
    required this.ortalama,
    required this.dersSayisi,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi ders girildi" : "Ders seçiniz",
          style: Sabitler.dersSayisiStyle,
        ),
        Text(
          ortalama > 0 ? "${ortalama.toStringAsFixed(2)}" : "0.0",
          style: Sabitler.ortalamaStyle,
        ),
        Text("Ortalama", style: Sabitler.ortalamaGosterBodyStyle),
      ],
    );
  }
}

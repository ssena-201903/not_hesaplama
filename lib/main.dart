import 'package:flutter/material.dart';
import 'package:not_hesaplama/constants/sabitler.dart';
import 'package:not_hesaplama/widgets/ortalama_hesapla_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        useMaterial3: false,
        // rengi bütün platformlara adapte eder.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      title: "Ortalama Hesaplama",
      home: OrtalamaHesaplaPage(),
    );
  }
}
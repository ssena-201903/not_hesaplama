import 'package:flutter/material.dart';
import 'package:not_hesaplama/constants/sabitler.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Sabitler.baslikText, style: Sabitler.baslikStyle),
        foregroundColor: Sabitler.baslikRenk,
      ),
    );
  }
}

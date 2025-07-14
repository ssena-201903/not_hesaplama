import 'package:flutter/material.dart';
import 'package:not_hesaplama/constants/sabitler.dart';
import 'package:not_hesaplama/helper/data_helper.dart';
import 'package:not_hesaplama/model/ders.dart';
import 'package:not_hesaplama/widgets/ders_listesi.dart';
import 'package:not_hesaplama/widgets/harf_dropdown_widget.dart';
import 'package:not_hesaplama/widgets/kredi_dropdown_widget.dart';
import 'package:not_hesaplama/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  // global key oluşturuldu form için
  final formKey = GlobalKey<FormState>();
  // dropdown için value
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    debugPrint("ana build çalıştı");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(Sabitler.baslikText, style: Sabitler.baslikStyle),
        foregroundColor: Sabitler.baslikRenk,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              // Form kısmı
              Expanded(flex: 2, child: _buildForm()),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                  ortalama: DataHelper.ortalamaHesapla(),
                  dersSayisi: DataHelper.tumEklenecekDersler.length,
                ),
              ),
            ],
          ),
          // liste gelecek
          Expanded(
            child: DersListesi(
              onElemanCikarildi: (index) {
                DataHelper.tumEklenecekDersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          // textFormField
          _buildTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // harf dropdownbutton widget eklendi, _buildHarfler silindi
              HarfDropdownWidget(
                onSelectedHarf: (value) {
                  secilenHarfDegeri = value;
                },
              ),
              // kredi dropdown
              KrediDropdownWidget(
                onSelectedKredi: (value) {
                  secilenKrediDegeri = value;
                },
              ),
              // iconbutton
              IconButton(
                onPressed: () {
                  _dersEkleVeOrtalamaHesapla();
                },
                icon: Icon(Icons.arrow_forward_ios, color: Sabitler.anaRenk),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "Ders adı boş girilemez";
          } else {
            return null;
          }
        },
        onSaved: (newValue) {
          girilenDersAdi = newValue!;
        },
        decoration: InputDecoration(
          hintText: "Matematik",
          border: OutlineInputBorder(borderRadius: Sabitler.borderRadius),
          filled: true,
          fillColor: Sabitler.anaRenk.shade50,
        ),
      ),
    );
  }

  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Ders eklenecekDers = Ders(
        ad: girilenDersAdi,
        harfDegeri: secilenHarfDegeri,
        krediDegeri: secilenKrediDegeri,
      );
      DataHelper.dersEkle(eklenecekDers);

      // hesaplama başarılıysa build etsin ve içini doldurmaya gerek yok
      setState(() {});
    }
  }
}

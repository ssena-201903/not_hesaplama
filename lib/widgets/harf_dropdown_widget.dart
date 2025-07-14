import 'package:flutter/material.dart';
import 'package:not_hesaplama/constants/sabitler.dart';
import 'package:not_hesaplama/helper/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget {
  // callback function
  final Function onSelectedHarf;

  const HarfDropdownWidget({super.key, required this.onSelectedHarf});

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDegeri = 4;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          padding: Sabitler.dropDownPadding,
          decoration: BoxDecoration(
            color: Sabitler.anaRenk.shade50,
            borderRadius: Sabitler.borderRadius,
          ),
          child: DropdownButton(
            elevation: 16,
            iconEnabledColor: Sabitler.anaRenk.shade300,
            focusColor: Colors.transparent,
            underline: Container(),
            value: secilenHarfDegeri,
            // itemslar datahelper'dan geliyor.
            items: DataHelper.dropDownMenuBilgisi(),
            onChanged: (value) {
              setState(() {
                // arayüzde güncellemeyi sağlar
                secilenHarfDegeri = value!;
                // veriyi gönderir
                widget.onSelectedHarf(value);
              });
            },
          ),
        ),
      ),
    );
  }
}

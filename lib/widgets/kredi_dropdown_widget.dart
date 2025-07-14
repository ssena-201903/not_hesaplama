import 'package:flutter/material.dart';
import 'package:not_hesaplama/constants/sabitler.dart';
import 'package:not_hesaplama/helper/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onSelectedKredi;

  const KrediDropdownWidget({super.key, required this.onSelectedKredi});

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKrediDegeri = 1;

  @override
  Widget build(BuildContext context) {
    debugPrint("build çalıştı");
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
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
            value: secilenKrediDegeri,
            // itemslar dataHelper'dan geliyor.
            items: DataHelper.dropDownKrediBilgisi(),
            onChanged: (e) {
              setState(() {
                secilenKrediDegeri = e!;
                widget.onSelectedKredi(e);
              });
            },
          ),
        ),
      ),
    );
  }
}

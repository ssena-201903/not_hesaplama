import 'package:flutter/material.dart';
import 'package:not_hesaplama/constants/sabitler.dart';
import 'package:not_hesaplama/helper/data_helper.dart';
import 'package:not_hesaplama/model/ders.dart';

class DersListesi extends StatelessWidget {
  Function onElemanCikarildi;
  DersListesi({required this.onElemanCikarildi, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenecekDersler;

    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                // eleman yok etme, kaydırarak
                key: UniqueKey(),
                direction: DismissDirection.startToEnd, // kaydırma yönü
                onDismissed: (a) {
                  onElemanCikarildi(index);
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          tumDersler[index].ad,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "${tumDersler[index].krediDegeri} kredi, Not değeri: ${tumDersler[index].harfDegeri}",
                        ),
                        leading: CircleAvatar(
                          radius: 36,
                          backgroundColor: Sabitler.anaRenk.shade600,
                          child: Text(
                            (tumDersler[index].harfDegeri *
                                    tumDersler[index].krediDegeri)
                                .toStringAsFixed(2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : Center(child: Text("Ders eklenmemiştir."));
  }
}

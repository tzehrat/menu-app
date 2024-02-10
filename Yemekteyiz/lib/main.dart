import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const Uygulamam());
}

class Uygulamam extends StatefulWidget {
  const Uygulamam({Key? key}) : super(key: key);

  @override
  State<Uygulamam> createState() => _UygulamamState();
}

class _UygulamamState extends State<Uygulamam> {
  @override
  Widget build(BuildContext context) {
    //   return Container(
    //   color: Colors.grey,
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        drawerScrimColor: Colors.black12,
        appBar: AppBar(
          shadowColor: Colors.pink,
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: Text(
            "GÜNÜN ÖNERİSİ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  @override
  State<YemekSayfasi> createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaCesidi = 1;

  int anaYemekCesidi = 1;

  int tatliCesidi = 1;

  List<String> corbaAdlari = [
    'Ayran Çorbası',
    'Mantar Çorbası',
    'Tarhana Çorbası',
    'Ezogelin Çorbası'
  ];

  List<String> anaYemekAdlari = [
    'Yaprak Sarma',
    'Tepsi Böreği',
    'İçli Köfte',
    'Nohutlu Pilav'
  ];

  List<String> tatliAdlari = [
    'Baklava',
    'Kazandibi',
    'Profiterol',
    'Dondurmalı İrmik Helvası'
  ];

  yemekDongusu() {
    setState(() {
      tatliCesidi = Random().nextInt(4) + 1;
      corbaCesidi = Random().nextInt(4) + 1;
      anaYemekCesidi = Random().nextInt(4) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Expanded(flex: 1, child: Image.asset('img/mantarç.jpeg')),
          // Expanded(flex: 2, child: Image.asset('img/nohutpilav.jpg')),
          // Expanded(flex: 2, child: Image.asset('img/baklava.jpg'))

          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextButton(
              // button rengi tanımlayadım araştır buton gölgesi tıkladıktan sonra vs
              onPressed: () {
                yemekDongusu();

                print('çorba çeşidi değişti');
              },

              child: Image.asset('img/corba$corbaCesidi.jpeg'),
            ),
          )),
          Text(
            corbaAdlari[corbaCesidi - 1],
            style: TextStyle(color: Colors.brown[500], fontSize: 20),
          ),
          Container(
            width: 200,
            child: Divider(
              color: Colors.black45,
              height: 6,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextButton(
                onPressed: () {
                  yemekDongusu();
                  print('ana yemek çeşidi değiştirildi');
                },
                child: Image.asset('img/ana$anaYemekCesidi.jpeg')),
          )),
          Text(
            anaYemekAdlari[anaYemekCesidi - 1],
            style: TextStyle(color: Colors.brown[500], fontSize: 20),
          ),
          Container(
            width: 200,
            child: Divider(
              color: Colors.black45,
              height: 6,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: TextButton(
              onPressed: () {
                yemekDongusu();
                print('tatlı çeşidi değiştirildi');
              },
              child: Image.asset('img/tatli$tatliCesidi.jpeg'),
            ),
          )),
          Text(
            tatliAdlari[tatliCesidi - 1],
            style: TextStyle(color: Colors.brown[500], fontSize: 20),
          ),
          Container(
            width: 200,
            child: Divider(
              color: Colors.black45,
              height: 6,
            ),
          ),
        ],
      ),
    );
  }
}

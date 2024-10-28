import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};
  final List<String> menu = [
    'Kebab Turki Spesial - Rp 22.000',
    'Nasi Kebuli Daging Kambing  - Rp 35.000',
    'Nasi Ayam Biryani - Rp 30.000',
    'Roti Maryam - Rp 15.000',
    'Sambossa - Rp 12.000',
  ];

  final String address = 'Jl. Rame Banget 127, Semarang';
  final String openingHours = 'Setiap Hari: 10.00 - 20.00';

  MainApp({super.key}){
    biodata['name'] = 'Food Container';
    biodata['email'] = 'Alibaba2022@gmail.com';
    biodata['phone'] = '+6281234567899';
    biodata['image'] = 'alibaba.jpg';
    //biodata['hobby'] = 'Bermain game';
    //biodata['addr'] = 'Jl.jalan aja';
    biodata['desc'] = 
        ''' Kedai AliBaba adalah kedai kontainer yang menjual berbagai makanan khas Negara Timur Tengah yang dipadukan dengan bumbu Indonesia. Berdiri sejak tahun 2021 di kota Semarang. ''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profil Resto",
      home: Scaffold(
        appBar: AppBar(title: const Text("Kedai AliBaba")),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            teksKotak(Colors.black, biodata['name'] ?? ''),
            Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
            SizedBox(height: 10),
            Row
              (children: [
                btnContact(Icons.alternate_email, Colors.green[900],
                  "mailto:${biodata['email']}"), 
                btnContact(Icons.mark_email_unread_rounded, Colors.blueAccent,
                  "https://wa.me/${biodata['phone']}"), 
                btnContact(Icons.map, Colors.deepPurple,
                "geo:-6.982439784617776, 110.40903913794091")
              ],
            ),
            SizedBox(height: 10),
            //textAttribute("Hobby", biodata['hobby'] ?? ''),
            //textAttribute("Alamat", biodata['addr'] ?? ''),
            SizedBox(height: 10),
            teksKotak(Colors.black38, 'Deskripsi'),
            SizedBox(height: 10),
            Text(biodata['desc'] ?? '', 
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            teksKotak(Colors.black38, 'Menu'),
            SizedBox(height: 10),
            ...menu.map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(item,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            )),
            SizedBox(height: 20),
            // Menambahkan teks alamat
            teksKotak(Colors.black38, 'Alamat'),
            SizedBox(height: 10),
            Text(
              address,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Menambahkan teks jam buka
            teksKotak(Colors.black38, 'Jam Buka'),
            SizedBox(height: 10),
            Text(
              openingHours,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ]),
        )
      ),
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(color: bgColor),
            child: Text(
              teks,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white),
              ),

          );
  }

  Row textAttribute(String judul, String teks) {
    return Row(
            children: [
            Container(
              width: 80,
              child: Text("- $judul", 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Text(":", style: TextStyle(fontSize: 18)),
            Text(teks, style: TextStyle(fontSize:18))
          ],
          );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    launch(uri);
                  },
                  child: Icon(icon),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              );
  }
  void launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))){
      throw Exception('Tidak dapat memanggil: $Uri'); 
    }
  }
}

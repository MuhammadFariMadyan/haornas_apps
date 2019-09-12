import 'package:flutter/material.dart';

class DetailCabangOlahraga extends StatelessWidget {
  DetailCabangOlahraga({
    this.nama,
    this.gambar,
    this.deskripsi,
  });

  final String nama;
  final String gambar;
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Cabang Olahraga'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 300,
            child: new Hero(
              tag: nama,
              child: new Material(
                child: new InkWell(
                  child: Image.asset(
                    'images/$gambar',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          new BagianNama(nama: nama),
          new BagianKeterangan(deskripsi: deskripsi),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
              ],
            ),
          ),          
        ],
      ),
    );
  }
}

class IconTeks extends StatelessWidget {
  IconTeks({this.iconData, this.teks});
  final IconData iconData;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            iconData,
            size: 20.0,
            color: Colors.blue,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  BagianKeterangan({this.deskripsi});
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            deskripsi,
            style: new TextStyle(fontSize: 14.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}

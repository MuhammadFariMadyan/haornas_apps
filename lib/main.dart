import 'package:flutter/material.dart';
// dipake nanti
import 'package:haornas_apps/launcher/launcher_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashPage(),
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration(seconds: 3),
            () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return HomePage();
              },
            ),
          );
        }
    );
    return SafeArea(
      child: Scaffold(
        body: new Center(
            child: Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.all(5.0)),
                Image.asset(
                  'images/eudeka-maskot.jpg',
                  height: 505.0,
                  width: 900.0,
                ),
                new Padding(padding: new EdgeInsets.all(5.0)),
                CircularProgressIndicator(),
              ],
            )
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Container> listCabangOlahraga = new List();

  var daftarCabangOlahraga = [
    {"nama":"1. Bridge", "images":"1.bridge.jpg"},
    {"nama":"2. Basketbal 3x3", "images":"2.basket-3x3.jpg"},
    {"nama":"3. Jet Ski", "images":"3.jetski.jpg"},
    {"nama":"4. JU-Jit Su", "images":"4.jujitsu.jpg"},
    {"nama":"5. Pencak Silat", "images":"5.pencak-silat.jpg"},
    {"nama":"6. Sambo", "images":"6.sambo.jpg"},
    {"nama":"7. Kurash", "images":"7.kurash.jpg"},
    {"nama":"8. Paralayang", "images":"8.paralayang.jpg"},
    {"nama":"9. Panjat Tebing", "images":"9.panjat-tebing.jpg"},
    {"nama":"10. Roller Sports", "images":"10.roller-sports.jpg"},
  ];

  _dataListCabangOlahraga() {
    for(var i = 0; i < daftarCabangOlahraga.length; i++){
      final listDataCabangOlahraga = daftarCabangOlahraga[i];
      final String imagesCabangOlahraga = listDataCabangOlahraga['images'];

      listCabangOlahraga.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new InkWell(
            onTap: (){
              // move to detail
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) => DetailCabangOlahraga(
                    nama: listDataCabangOlahraga['nama'],
                    gambar: imagesCabangOlahraga,
                  ),
                ),
              );
            },
            child: new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.all(10.0),),
                new Hero(tag: listDataCabangOlahraga['nama'], child: new Image.asset(
                  "images/$imagesCabangOlahraga",
                  height: 150.0, width: 100.0, fit: BoxFit.cover,
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(10.0)),
                new Text(listDataCabangOlahraga['nama'], style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),),
              ],
            ),
          ),
        ),
      ));
    }
  }

  @override
  void initState(){
    super.initState();
    _dataListCabangOlahraga();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('10 Cabang Baru di Asean Games 2018'),
        backgroundColor: Colors.blue,
      ),
      resizeToAvoidBottomPadding: false,
      body: new Container(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (itemWidth / itemHeight),
          controller: new ScrollController(keepScrollOffset: false),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: listCabangOlahraga,
        ),
      ),
    );
  }

}


class DetailCabangOlahraga extends StatelessWidget {
  DetailCabangOlahraga({
    this.nama,
    this.gambar,
  });

  final String nama;
  final String gambar;

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
            child: new Hero(tag: nama, child: new Material(
              child: new InkWell(
                child: Image.asset('images/$gambar', fit: BoxFit.contain,),
              ),
            ),),
          ),

          new BagianNama(
            nama: nama
          ),

          new BagianIcon(),

          new BagianKeterangan(),
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
          new Expanded(child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(nama, style: new TextStyle(fontSize: 20.0, color: Colors.red),),
            ],
          ),),

          new Row(
            children: <Widget>[
              new Icon(Icons.star, size: 30.0, color: Colors.red,),
              new Text("12", style: new TextStyle(fontSize: 18.0),),
            ],
          )
        ],
      ),
    );
  }
}

class  BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          new IconTeks(
              iconData : Icons.call,
              teks : "Call"
          ),

          new IconTeks(
              iconData : Icons.message,
              teks : "Message"
          ),

          new IconTeks(
              iconData : Icons.photo,
              teks : "Photo"
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
          new Icon(iconData, size: 20.0, color: Colors.red,),
          new Text(teks, style: new TextStyle(fontSize: 12.0, color: Colors.red),)
        ],
      ),
    );
  }
}

class BagianKeterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(padding: const EdgeInsets.all(10.0),
          child: new Text("Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum.",
            style: new TextStyle(fontSize: 14.0),
            textAlign: TextAlign.justify,
          ),

        ),
      ),
    );
  }
}
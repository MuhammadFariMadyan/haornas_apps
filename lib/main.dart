import 'package:flutter/material.dart';
// dipake nanti
// import 'package:haornas_apps/launcher/launcher_view.dart';

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
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return HomePage();
          },
        ),
      );
    });
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
        )),
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
    {
      "nama": "1. Bridge",
      "images": "1.bridge.jpg",
      "deskripsi":
          "Cabang olahraga ini baru pertama kali dihelat di Asian Games 2018. Di cabor Bridge, ada 6 kategori yang dipertandingkan yakni Men Team, Ladies Team, Men Pairs, Mixed Team, Mixed Pairs dan Super Mixed Team. Cabor Bridge sendiri sudah dilaksanakan pada tangal 18 Agustus hingga 2 September 2018 di Komplek Stadion GBK, Jakarta."
    },
    {
      "nama": "2. Basketbal 3x3",
      "images": "2.basket-3x3.jpg",
      "deskripsi":
          "Cabor basket sendiri sebenarnya sudah lama dipertandingkan di Asian Games. Tapi ada satu sub cabang dari basket yang baru dipertandingkan untuk pertama kalinya di Asian Games 2018 yakni Basket 3 on 3. Mempertandingkan dua kategori lomba yakni Men Team dan Women Team."
    },
    {
      "nama": "3. Jet Ski",
      "images": "3.jetski.jpg",
      "deskripsi":
          "Cabor yang baru pertama kali hadir di Asian Games 2018 ini mempertandingkan 6 kategori yakni runabout open, runabout 1000, runabout endurance, runabout stock, open ski dan sport GP."
    },
    {
      "nama": "4. JU-Jit Su",
      "images": "4.jujitsu.jpg",
      "deskripsi":
          "Olahraga beladiri ini mempertandingkan beberapa kategori, antara lain Newaza Men 56kg, 62kg, 69kg, 77kg, 85kg, 94kg. Newaza Women 49kg dan 62kg."
    },
    {
      "nama": "5. Pencak Silat",
      "images": "5.pencak-silat.jpg",
      "deskripsi":
          "Cabang olahraga asli Indonesia ini mempertandingkan 16 nomor dengan rincian 10 nomor tanding (tujuh putra dan tiga putri) dan enam nomor seni (tunggal putra dan putri, ganda putra dan putri, serta regu putra dan putri)."
    },
    {
      "nama": "6. Sambo",
      "images": "6.sambo.jpg",
      "deskripsi":
          "Pertama kali dipertandingan, di Asian Games 2018 cabor Sambo akan memainkan empat nomor yakni 62 kg putra, 74 kg putra, 56 kg putri, dan 64 kg putri. Indonesia sendiri menurunkan masing-masing dua atlet di semua nomor tersebut."
    },
    {
      "nama": "7. Kurash",
      "images": "7.kurash.jpg",
      "deskripsi":
          "Cabor asal Timur Tengah ini mempertandingkan beberapa nomor di Asian Games 2018, antara lain Men 81kg, Men -90kg, Men +90kg dan Women -52kg, Women -63kg, Women -78kg."
    },
    {
      "nama": "8. Paralayang",
      "images": "8.paralayang.jpg",
      "deskripsi":
          "Cabang olahraga satu ini mempertandingkan beberapa nomor di Asian Games 2018, antara lain Men Individual Accuracy, Men's Team accuracy, Men's Team Cross Country dan Women Individual Accuracy, Women's Team Accuracy, Women's Team Cross Country."
    },
    {
      "nama": "9. Panjat Tebing",
      "images": "9.panjat-tebing.jpg",
      "deskripsi":
          "Di Asian Games 2018 ini, panjat tebing untuk pertama kalinya mempertandingkan beberapa nomor antara lain Men's Speed, Men's Combined, Men's Speed Relay dan Women's Speed, Women's Combined, Women'S Speed Relay."
    },
    {
      "nama": "10. Roller Sports",
      "images": "10.roller-sports.jpg",
      "deskripsi":
          "Di Asian Games 2018, cabang olahraga ini mempertandingkan dua nomor yakni Men's Road 20km Race dan Women's Road 20km Race. Itulah 10 cabang olahraga baru yang bakal ada di Asian Games 2018. Membuat kita makin gak sabar kan menunggu di mulainya kompetisi olahraga terbesar se-Asia ini?"
    },
  ];

  _dataListCabangOlahraga() {
    for (var i = 0; i < daftarCabangOlahraga.length; i++) {
      final listDataCabangOlahraga = daftarCabangOlahraga[i];
      final String imagesCabangOlahraga = listDataCabangOlahraga['images'];

      listCabangOlahraga.add(new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new InkWell(
            onTap: () {
              // move to detail
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => DetailCabangOlahraga(
                    nama: listDataCabangOlahraga['nama'],
                    gambar: imagesCabangOlahraga,
                    deskripsi: listDataCabangOlahraga['deskripsi'],
                  ),
                ),
              );
            },
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(10.0),
                ),
                new Hero(
                  tag: listDataCabangOlahraga['nama'],
                  child: new Image.asset(
                    "images/$imagesCabangOlahraga",
                    height: 150.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                new Padding(padding: new EdgeInsets.all(10.0)),
                new Text(
                  listDataCabangOlahraga['nama'],
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
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
          new BagianIcon(),
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
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.blue,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: new Row(
        children: <Widget>[
          new IconTeks(iconData: Icons.call, teks: "Call"),
          new IconTeks(iconData: Icons.message, teks: "Message"),
          new IconTeks(iconData: Icons.photo, teks: "Photo"),
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

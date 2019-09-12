import 'package:flutter/material.dart';
import 'package:haornas_apps/detail/detail_page.dart';

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

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 169, 125, 61),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 178, 84),
        title: Text("Risma Amila Putri"),
        titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 2, 7, 10),
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "YEPPEUSTORE",
                style: TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 350,
                height: 250,
                margin: EdgeInsets.only(top: 61),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/toko.png"),
                  ),
                ),
              ),
              Text(
                "MAKE UP",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 11, 12),
                ),
              ),
              Text(
                "Selamat Datang Di YeuppeuStore \n Kami Menyediakan Berbagai Kosmetik \n Dengan Harga Terjangkau Dan Kualitas Terbaik",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return _ThirdPageState();
                      },
                    ),
                  );
                },
                child: Text("Lihat"),
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 250, 178, 84),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SizeContainer extends StatelessWidget {
  const SizeContainer({Key? key, this.isActive = false, required this.size})
      : super(key: key);

  final bool isActive;
  final String size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? Color.fromARGB(255, 87, 55, 12) : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: Color.fromARGB(255, 49, 35, 16),
        ),
      ),
      child: Text(
        size,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: isActive ? Colors.white : Color.fromARGB(255, 3, 5, 5),
        ),
      ),
    );
  }
}

class _ThirdPageState extends StatefulWidget {
  const _ThirdPageState({Key? key}) : super(key: key);

  @override
  State<_ThirdPageState> createState() => __ThirdPageStateState();
}

class __ThirdPageStateState extends State<_ThirdPageState> {
  final List<BottomNavigationBarItem> _myItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.point_of_sale_outlined),
      label: "Pilihan",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.list_sharp),
      label: "Form",
    ),
  ];

  final List<Widget> _myViews = [
    PageOne(),
    MyHomePage(),
  ];
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myViews.elementAt(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        items: _myItems,
        onTap: (int newIndex) {
          setState(() {
            _pageIndex = newIndex;
          });
        },
      ),
    );
  }
}

enum Pilihan { Unknown, Merek, Jenis, Padat, Cair }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String NamaAnda = '', PesananAnda = '', JumlahPesanan = '';
  final ctrlNamaAnda = TextEditingController();
  final ctrlPesananAnda = TextEditingController();
  final ctrlJumlahPesanan = TextEditingController();

  @override
  void dispose() {
    ctrlNamaAnda.dispose();
    ctrlPesananAnda.dispose();
    ctrlJumlahPesanan.dispose();
    super.dispose();
  }

  bool isAda = false;
  Pilihan pilihan = Pilihan.Unknown;

  String getPilihan(Pilihan value) {
    if (value == Pilihan.Merek) {
      return "Merek";
    } else if (value == Pilihan.Jenis) {
      return 'Jenis';
    } else if (value == Pilihan.Padat) {
      return 'Padat';
    } else if (value == Pilihan.Cair) {
      return 'Cair';
    }
    return "Kosong";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 169, 125, 61),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 178, 84),
        title: Text("Risma Amila Putri"),
        titleTextStyle: TextStyle(
          color: Colors.black45,
          fontSize: 20,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "YEPPEUSTORE",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 950,
                height: 850,
                padding: EdgeInsets.all(25),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 250, 178, 84),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 48),
                    TextField(
                      controller: ctrlNamaAnda,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Isi Nama Anda",
                        labelText: "Nama Anda",
                      ),
                    ),
                    SizedBox(height: 48),
                    TextFormField(
                      controller: ctrlPesananAnda,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Isi Pesanan Anda",
                        labelText: "Pesanan Anda",
                      ),
                    ),
                    SizedBox(height: 48),
                    TextFormField(
                      controller: ctrlJumlahPesanan,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Isi Jumlah Pesanan Anda",
                        labelText: "Jumlah Pesanan Anda",
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      title: Text("???"),
                      leading: Radio(
                        groupValue: pilihan,
                        value: Pilihan.Unknown,
                        onChanged: (Pilihan? value) {
                          setState(() {
                            pilihan = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text("Ada Lagi ?"),
                      leading: Checkbox(
                        value: isAda,
                        onChanged: (bool? value) {
                          setState(() {
                            isAda = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text("Merek"),
                      leading: Radio(
                        groupValue: pilihan,
                        value: Pilihan.Merek,
                        onChanged: (Pilihan? value) {
                          setState(() {
                            pilihan = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text("Jenis"),
                      leading: Radio(
                        groupValue: pilihan,
                        value: Pilihan.Jenis,
                        onChanged: (Pilihan? value) {
                          setState(() {
                            pilihan = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text("Padat"),
                      leading: Radio(
                        groupValue: pilihan,
                        value: Pilihan.Padat,
                        onChanged: (Pilihan? value) {
                          setState(() {
                            pilihan = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: Text("Cair"),
                      leading: Radio(
                        groupValue: pilihan,
                        value: Pilihan.Cair,
                        onChanged: (Pilihan? value) {
                          setState(() {
                            pilihan = value!;
                          });
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          NamaAnda = ctrlNamaAnda.text;
                          PesananAnda = ctrlPesananAnda.text;
                          JumlahPesanan = ctrlJumlahPesanan.text;
                        });
                      },
                      child: Text(
                        "Tampilkan",
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 250, 178, 84),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Nama Anda $NamaAnda",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Pesanan Anda Adalah $PesananAnda",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Jumlah Pesanan Anda $JumlahPesanan",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Ada Lagi? ${isAda ? "Ada" : "Tidak Ada"}",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Tipe ${getPilihan(pilihan)}"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 169, 125, 61),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 178, 84),
        title: Text("Risma Amila Putri"),
        titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 2, 7, 10),
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 450,
                height: 250,
                margin: EdgeInsets.only(top: 61),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/toko.png"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizeContainer(isActive: true, size: "Wardah"),
                  SizeContainer(size: "Emina"),
                  SizeContainer(size: "Make Over"),
                  SizeContainer(size: "Implora"),
                  SizeContainer(size: "Looke"),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizeContainer(size: "MadamGie"),
                  SizeContainer(size: "Pixy"),
                  SizeContainer(size: "Maybelline"),
                  SizeContainer(size: "SK-II"),
                  SizeContainer(size: "Viva"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

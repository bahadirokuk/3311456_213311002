import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rezervasyon/pages/gecmis.dart';
import 'package:rezervasyon/pages/hakkinda.dart';
import 'package:rezervasyon/widgets/custom_appbar.dart';
import 'package:rezervasyon/widgets/custom_background.dart';
import 'package:rezervasyon/widgets/custom_bedge.dart';
import 'oda_sayfa.dart';
import 'package:rezervasyon/liste.dart';

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({super.key, required this.title});

  final String title;

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  String _userInputname = '';
  String _userInputnumber = '';

  @override
  Widget build(BuildContext context) {
    bool buttonAktif = false;
    if (_userInputname.isNotEmpty && _userInputnumber.length == 11) {
      buttonAktif = true;
    } else {
      buttonAktif = false;
    }
    return Scaffold(
      appBar: CustomAppBar(
          tittle: widget.title,
          actions: const []
      ),
      body: Container(
        decoration: Background.backgroung("assets/images/BackGround/otelBack3.jpg"),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Image(
                  image: AssetImage("assets/images/otelpng2.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _userInputname = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adınız ve Soyadınız',
                  ),
                  keyboardType: TextInputType.text,
                  inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _userInputnumber = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Numaranız',
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                child: ElevatedButton(
                    onPressed: buttonAktif
                        ? () {
                            Liste.isimler.add(_userInputname);
                            Liste.numaralar.add(_userInputnumber);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                              return const OdaSayfa();
                            }));
                          }
                        : null,
                    child: const Text("Odalar")
                ),
              ),
              CustomBadge(
                content:Liste.odabilgileri.length,
                child:ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return const Gecmis();
                    }));
                  },
                  child: const Text("Geçmiş")
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return const Hakkinda();
                      }));
                    },
                    child: const Text("Hakkında")
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

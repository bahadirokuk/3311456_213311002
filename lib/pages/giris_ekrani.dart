import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rezervasyon/pages/gecmis.dart';
import 'package:rezervasyon/widgets/custom_appbar.dart';
import 'package:rezervasyon/widgets/custom_bedge.dart';
import 'oda_sayfa.dart';
import 'package:rezervasyon/liste.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/otel.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.screen,
            ),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Image(
                  image: AssetImage("assets/images/otel2.png"),
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
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
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
            ],
          ),
        ),
      ),
    );
  }
}

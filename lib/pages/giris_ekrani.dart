import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rezervasyon/pages/gecmis.dart';
import 'package:rezervasyon/widgets/designed_appbar.dart';
import 'oda_sayfa.dart';
import 'package:rezervasyon/liste.dart';
import 'package:badges/badges.dart' as badges;
class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _userInput = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesignedAppBar(tittle: widget.title),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/otel.jpg"),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical:0,horizontal:20),
                child: TextField(
                  onChanged: (value){
                    setState(() {
                      _userInput=value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adınız ve Soyadınız',
                  ),
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:20,horizontal:0),
                child: ElevatedButton(
                    onPressed: () {
                      Liste.isimler.add(_userInput);
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) {
                                return OdaSayfa();
                              }
                          )
                      );
                    },
                    child: const Text("Odalar")
                ),
              ),
              badges.Badge(
                badgeContent: Text(Liste.isimler.length.toString()),
                  badgeStyle: const badges.BadgeStyle(
                      badgeGradient: badges.BadgeGradient.linear(
                        colors: [Colors.white,Color.fromRGBO(142, 194, 211, 1)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
                      )),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) {
                                return Gecmis();
                              }
                          )
                      );
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
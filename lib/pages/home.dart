import 'package:flutter/material.dart';
import 'package:rezervasyon/pages/gecmis.dart';
import 'package:rezervasyon/widgets/designed_appbar.dart';
import 'oda_sayfa.dart';
import 'package:rezervasyon/kiralama_liste.dart';
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value){
                setState(() {
                  _userInput=value;
                });
              },
            ),
            ElevatedButton(
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
    );
  }
}
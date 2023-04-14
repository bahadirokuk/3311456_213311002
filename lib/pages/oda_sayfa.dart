import 'package:flutter/material.dart';
import 'package:rezervasyon/widgets/custom_appbar.dart';
import 'package:rezervasyon/widgets/custom_boxdecoration.dart';
import 'package:rezervasyon/pages/inceleme_sayfa.dart';
import 'package:rezervasyon/pages/gecmis.dart';
import 'package:rezervasyon/liste.dart';
import 'hakkinda.dart';

class OdaSayfa extends StatefulWidget {
  const OdaSayfa({Key? key}) : super(key: key);

  @override
  State<OdaSayfa> createState() => _OdaSayfaState();
}

class _OdaSayfaState extends State<OdaSayfa> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.access_time),
            tooltip: 'Rezervasyonlar',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Gecmis();
              }));
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            tooltip: 'Hakkında',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const Hakkinda();
              }));
            },
          ),
        ],
        tittle: 'Odalar',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Geri',
          onPressed: () {
            setState(() {
              Liste.isimler.removeLast();
              Liste.numaralar.removeLast();
              Navigator.of(context).pop();
            });
          },
        ),
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: Liste.oda.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 150,
              decoration: CutomBoxDecoraiton.boxDecoraiton,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Spacer(flex: 1),
                    Text(Liste.oda[index][0][0],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    const Spacer(flex: 1),
                    Text(Liste.oda[index][0][1]),
                    const Spacer(flex: 1),
                    Text(Liste.oda[index][0][2]),
                    const Spacer(flex: 3),
                    FilledButton.tonal(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return Inceleme(index: index);
                          }));
                        },
                        child: const Text('İncele'))
                  ]),
                  Card(
                    color: const Color.fromRGBO(224, 247, 255, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage(Liste.oda[index][0][3]),
                        width: 190,
                        fit: BoxFit.fitWidth, //
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

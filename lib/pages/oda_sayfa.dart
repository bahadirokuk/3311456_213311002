import 'package:flutter/material.dart';
import 'package:rezervasyon/widgets/designed_appbar.dart';
import 'package:rezervasyon/widgets/designed_BoxDecoration.dart';
import 'package:rezervasyon/kiralama_liste.dart';
import 'package:rezervasyon/pages/inceleme_sayfa.dart';

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
      appBar: DesignedAppBar(
        tittle: 'Odalar',
        leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  Liste.isimler.removeLast();
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
              decoration: DesignedBoxDecoraiton.designedBoxDecoraiton,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(flex: 1),
                        Text(Liste.oda[index][0][0]),
                        const Spacer(flex: 1),
                        Text(Liste.oda[index][0][1]),
                        const Spacer(flex: 1),
                        Text(Liste.oda[index][0][2]),
                        const Spacer(flex: 3),
                        FilledButton.tonal(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                return Inceleme(
                                    index:index
                                );
                              }));
                            },
                            child: const Text('İncele')
                        )
                      ]
                  ),
                  Card(
                    color: const Color.fromRGBO(224, 247, 255, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage(Liste.oda[index][0][3]),
                        width: 200,
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

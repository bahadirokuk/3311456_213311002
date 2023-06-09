import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rezervasyon/pages/giris_ekrani.dart';
import 'package:rezervasyon/pages/gecmis.dart';
import 'package:rezervasyon/pages/hakkinda.dart';
import 'package:rezervasyon/widgets/custom_appbar.dart';
import 'package:rezervasyon/widgets/custom_boxdecoration.dart';
import 'package:rezervasyon/widgets/custom_fotogalery.dart';
import 'package:rezervasyon/liste.dart';

import '../widgets/custom_background.dart';

class Inceleme extends StatefulWidget {
  const Inceleme({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<Inceleme> createState() => _IncelemeState();
}

class _IncelemeState extends State<Inceleme> {
  late ScrollController _scrollController;
  late TextEditingController _textEditingController;
  String _userInput = '';
  bool _isVisible = true;

  List<Widget> myWidgets = [];

  void fonk() {
    myWidgets = [
      Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: CutomBoxDecoraiton.boxDecoraiton,
            child: Text(Liste.oda[widget.index][1].last + Liste.oda[widget.index][2].last),
          )),
      ...myWidgets
    ];
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _textEditingController = TextEditingController();
    _scrollController.addListener(_listen);
  }

  void _listen() {
    final ScrollDirection direction = _scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      if (!_isVisible) {
        setState(() => _isVisible = true);
      }
    } else if (direction == ScrollDirection.reverse) {
      if (_isVisible) {
        setState(() => _isVisible = false);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var fotoList = [Liste.oda[widget.index][0][3], Liste.oda[widget.index][0][4], Liste.oda[widget.index][0][5]];
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
        tittle: Liste.oda[widget.index][0][0],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Geri',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Container(decoration: Background.backgroung("assets/images/BackGround/otelBack4.jpg")),
          ListView(
          controller: _scrollController,
          children: [
            CustomFotoGalery(fotolist: fotoList),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: CutomBoxDecoraiton.boxDecoraiton,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Liste.oda[widget.index][0][0],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                                child: Text(Liste.oda[widget.index][0][1]),
                              ),
                              SizedBox(width: 180, child: Text(Liste.oda[widget.index][0][6])),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text(Liste.oda[widget.index][0][2],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                )),
                            ElevatedButton(
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Rezervasyon Yap'),
                                  content: const Text('Rezervasyon yapmaktan emin misiniz?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      child: const Text('Hayır'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Liste.odabilgileri.add(
                                            '${Liste.oda[widget.index][0][0]}  ${Liste.oda[widget.index][0][2]}\n${DateTime.now().toString()}');
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                          return const GirisEkrani(title: 'Tekrardan hosgeldin');
                                        }));
                                      },
                                      child: const Text('Evet'),
                                    ),
                                  ],
                                ),
                              ),
                              child: const Text('Rezervasyon Yap'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Divider(),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Yorum',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _userInput = value;
                                });
                              },
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Liste.oda[widget.index][2].add(_userInput);
                                Liste.oda[widget.index][1].add(Liste.isimler.last);
                                fonk();
                              });
                            },
                            child: const Text("Yorum Yap")),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                            Liste.oda[widget.index][1].length,
                            (index) => Container(
                                  width: double.infinity,
                                  constraints: const BoxConstraints(maxWidth: double.infinity),
                                  padding: const EdgeInsets.all(10),
                                  decoration: CutomBoxDecoraiton.boxDecoraiton,
                                  child: Text(
                                      '${Liste.oda[widget.index][1][index]}\n Yorum: ${Liste.oda[widget.index][2][index]}'),
                                )).reversed.toList(),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),]
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: _isVisible ? 80.0 : 0,
        child: BottomAppBar(
          elevation: null,
          child: Row(
            children: const <Widget>[
              Expanded(
                  child: Image(
                image: AssetImage("assets/images/kargo-banner.jpg"),
                fit: BoxFit.fill,
              ))
            ],
          ),
        ),
      ),
    );
  }
}

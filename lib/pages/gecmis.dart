import 'package:flutter/material.dart';
import 'package:rezervasyon/widgets/custom_appbar.dart';
import 'package:rezervasyon/liste.dart';
import 'package:rezervasyon/widgets/custom_boxdecoration.dart';

class Gecmis extends StatefulWidget {
  const Gecmis({Key? key}) : super(key: key);

  @override
  State<Gecmis> createState() => _GecmisState();
}

class _GecmisState extends State<Gecmis> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 9),
            child: Icon(Icons.access_time_filled),
          )
        ],
        tittle: 'Rezervasyonlar',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Geri',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: Liste.odabilgileri.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: CutomBoxDecoraiton.designedBoxDecoraiton,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('İsim : ${Liste.isimler[index]}'),
                          Text('Numara : ${Liste.numaralar[index]}\n'),
                          Text('Oda Bilgileri : ${Liste.odabilgileri[index]}'),
                        ],
                      ))),
            ],
          );
        },
      ),
    );
  }
}

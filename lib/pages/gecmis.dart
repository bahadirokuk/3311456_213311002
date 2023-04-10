import 'package:flutter/material.dart';
import 'package:rezervasyon/widgets/designed_appbar.dart';
import 'package:rezervasyon/kiralama_liste.dart';
import 'package:rezervasyon/widgets/designed_BoxDecoration.dart';

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
      appBar: DesignedAppBar(
        tittle: 'Rezervasyonlar',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: Liste.odaisim.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: DesignedBoxDecoraiton.designedBoxDecoraiton,
                      child:
                          Text(Liste.isimler[index] + Liste.odaisim[index])
                  )
              ),
            ],
          );
        },
      ),
    );
  }
}

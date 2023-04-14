import 'package:flutter/material.dart';
import 'package:rezervasyon/widgets/custom_appbar.dart';
import 'package:rezervasyon/widgets/custom_background.dart';
import 'package:rezervasyon/widgets/custom_boxdecoration.dart';

import 'gecmis.dart';

class Hakkinda extends StatelessWidget {
  const Hakkinda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        tittle: 'Hakkında',
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Geri',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 9),
            child: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Container(
        decoration: Background.backgroung("assets/images/BackGround/otelBack.jpg"),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Image(
                  image: AssetImage("assets/images/otelpng.png"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: CutomBoxDecoraiton.boxDecoraiton,
                    child: const Text(
                        "  Bu proje Mehmet Bahadır OKUK tarafından 3311456 ders kodlu Mobil Programlama dersinin ara sınavı için tasarlanmıştır. Projem otel odası rezervasyon uygulamasıdır. Giriş ekranında kullanıcı bilgileri alınıp odalar liste halinde gösterilmektedir. Her bir odayı ayrı ayrı inceleyebilmekteyiz. İnceleme ekranında ayrıntılı bilgileri ve yorumları görebildiğimiz, yorum ve rezervasyon yapabimeldiğimiz, ana ekrandan veya appbar üzerinden geçmiş rezervasyonları liste halinde görebildiğimiz bir uygulamadır.")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

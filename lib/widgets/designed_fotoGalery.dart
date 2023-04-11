import 'package:flutter/material.dart';

class DesignedFotoGalery extends StatelessWidget {
  const DesignedFotoGalery({Key? key, required this.fotolist})
      : super(key: key);
  final List<String> fotolist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 2,
                child: SizedBox(
                  height: double.infinity,
                  child: Image(
                    image: AssetImage(fotolist[0]),
                    fit: BoxFit.fill,
                  ),
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(fotolist[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(fotolist[2]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

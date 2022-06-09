import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cardEpisodios(),
    );
  }

  Widget _cardEpisodios() {
    return Container(
      color: Colors.amber,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Card(
            child:
                SizedBox(width: 180, height: 180, child: Text("Hello World"))),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    "Episódio 28",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.raleway(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5, top: 10),
                  child: Text(
                    'Histórias de Infância',
                    style: GoogleFonts.raleway(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';

class PageEpisode extends StatefulWidget {
  const PageEpisode({Key? key}) : super(key: key);

  @override
  State<PageEpisode> createState() => _PageEpisodeState();
}

class _PageEpisodeState extends State<PageEpisode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 80,
          title: Center(
            child: Row(
              children: [
                Image.asset(
                  'assets/logo_full.png',
                  fit: BoxFit.cover,
                  height: 50,
                ),
              ],
            ),
          )),
      body: _createPageEpisode(),
    );
  }

  Widget _createPageEpisode() {
    return Container(
      color: Colors.red,
      child: Text('Teste'),
    );
  }
}

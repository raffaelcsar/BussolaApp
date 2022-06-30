import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageEpisode extends StatefulWidget {
  const PageEpisode({Key? key}) : super(key: key);

  @override
  State<PageEpisode> createState() => _PageEpisodeState();
}

class _PageEpisodeState extends State<PageEpisode> {
  bool click = true;

  final dataString =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas posuere ut nisi sed elementum. Quisque vel pulvinar justo. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur eu aliquam risus. Fusce pulvinar orci augue, sed sagittis massa cursus vitae. Nulla porta tincidunt quam non convallis. In interdum sapien eleifend purus ullamcorper, eget aliquam est iaculis. Curabitur est risus, dignissim vitae felis eu, hendrerit posuere sapien. Proin vitae euismod ipsum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam interdum, massa eu sollicitudin pulvinar, mauris ligula porttitor erat, a accumsan mauris lorem ac sapien.';

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
    return ListView(
      children: [
        _createHeader(),
        Divider(
          thickness: 2,
          color: Color.fromARGB(255, 229, 229, 229),
        ),
        _createHost(),
        Divider(
          thickness: 2,
          color: Color.fromARGB(255, 229, 229, 229),
        ),
        _description(),
      ],
    );
  }

  Widget _createHeader() {
    return Stack(
      children: [
        // Image of Episode

        Container(
          margin: EdgeInsets.all(0),
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)
                  .createShader(Rect.fromLTRB(0, 100, 0, 300));
            },
            blendMode: BlendMode.dstIn,
            child: Image(
              width: MediaQuery.of(context).size.width,
              height: 300,
              image: NetworkImage(
                  'https://sm.ign.com/ign_br/screenshot/default/doutor-estranho-multiverso-loucura_jmqu.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Title of episode
        Padding(
          padding: EdgeInsets.only(top: 280, left: 20),
          child: Row(
            children: [
              Container(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Doutor Estranho".toUpperCase(),
                        textAlign: TextAlign.left,
                        style: GoogleFonts.raleway(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "no Multiverso da Loucura",
                      style: GoogleFonts.raleway(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(
                    (click == false)
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    size: 25,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      click = !click;
                    });
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createHost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text("Host".toUpperCase(),
              style: GoogleFonts.raleway(
                  fontSize: 20, fontWeight: FontWeight.w500)),
        ),
        Container(
          padding: EdgeInsets.only(left: 15),
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1529523541036654593/vxUdO-xs_400x400.jpg'),
                    radius: 30,
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1175879661546627075/rSfovoua_400x400.jpg'),
                    radius: 30,
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/profile_images/1477662514146160640/gL8rEeBk_400x400.jpg'),
                    radius: 30,
                  )),
            ],
          ),
        )
      ],
    );
  }

  Widget _description() {
    return Container(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text('Descrição'.toUpperCase(),
                    style: GoogleFonts.raleway(
                        fontSize: 20, fontWeight: FontWeight.w500))),
            Padding(
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Text(
                  dataString,
                  style: TextStyle(fontSize: 16),
                )),
          ],
        ));
  }
}

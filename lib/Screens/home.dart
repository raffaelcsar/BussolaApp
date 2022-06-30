import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:bussola_app/Screens/pageEpisode.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CardEp {
  final String urlImage;
  final String title;
  final String episode;

  const CardEp(
      {required this.urlImage, required this.title, required this.episode});
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RefreshController _controller = RefreshController();
  final dataString =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas posuere ut nisi sed elementum. Quisque vel pulvinar justo. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur eu aliquam risus. Fusce pulvinar orci augue, sed sagittis massa cursus vitae. Nulla porta tincidunt quam non convallis. In interdum sapien eleifend purus ullamcorper, eget aliquam est iaculis. Curabitur est risus, dignissim vitae felis eu, hendrerit posuere sapien. Proin vitae euismod ipsum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam interdum, massa eu sollicitudin pulvinar, mauris ligula porttitor erat, a accumsan mauris lorem ac sapien.';
  int itemsCount = 4;
  List<CardEp> items = [
    CardEp(
      urlImage:
          "https://s3-us-west-2.amazonaws.com/anchor-generated-image-bank/production/podcast_uploaded_episode400/1979348/1979348-1654985992675-265627cddce79.jpg",
      title: "DEMÔNIOS - Especial: Criaturas da Cultura Pop",
      episode: "Episódio #29",
    ),
    CardEp(
      urlImage:
          "https://s3-us-west-2.amazonaws.com/anchor-generated-image-bank/production/podcast_uploaded_episode400/1979348/1979348-1653514777340-61d0334462489.jpg",
      title: "CriticaMais - Doutor Estranho no Multiverso da Loucura",
      episode: "Episódio #15",
    ),
    CardEp(
      urlImage:
          "https://s3-us-west-2.amazonaws.com/anchor-generated-image-bank/production/podcast_uploaded_episode400/1979348/1979348-1653189985504-b6a571a9042b6.jpg",
      title: "Histórias de Infância",
      episode: "Episódio #28",
    ),
    CardEp(
      urlImage:
          "https://s3-us-west-2.amazonaws.com/anchor-generated-image-bank/production/podcast_uploaded_episode400/1979348/1979348-1651887747897-4340bc3e4968a.jpg",
      title: "Universos Fantásticos",
      episode: "Episódio #27",
    ),
    CardEp(
      urlImage:
          "https://s3-us-west-2.amazonaws.com/anchor-generated-image-bank/production/podcast_uploaded_episode400/1979348/1979348-1648409329286-0856379eb620c.jpg",
      title: "GameShow",
      episode: "Episódio #26",
    ),
  ];

  void _fetch() {
    if (items.length != itemsCount && items.length < itemsCount) {
      itemsCount = items.length;
      _controller.loadComplete();
      print(items.length);
    } else {
      itemsCount = items.length;
      _controller.loadComplete();
    }
  }

  void _onRefresh() async {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => _controller.refreshCompleted());
  }

  void _onLoading() {
    Future.delayed(Duration(seconds: 2)).then((value) => _fetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logo_full.png',
              fit: BoxFit.cover,
              height: 50,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
      ),
      body: _createHome(),
    );
  }

  Widget _createHome() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              _cardLastEpis(),
              // _menu(),
              _containerEpisodios(),
              _gradeMovies(),
            ],
          )
        ],
      ),
    );
  }

  Widget _menu() {
    return Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                offset: Offset(0.0, 0.20))
          ],
        ),
        child: Center(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black,
                      primary: Colors.white,
                      shape: StadiumBorder(),
                    ),
                    child: Image(
                      image: AssetImage("assets/icons/Padrao.png"),
                      width: 30.0,
                      height: 30.0,
                      color: null,
                    ),
                    onPressed: () {}),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black,
                      primary: Colors.white,
                      shape: StadiumBorder(),
                    ),
                    child: Image(
                      image: AssetImage("assets/icons/CriticaMais.png"),
                      width: 30.0,
                      height: 30.0,
                      color: null,
                    ),
                    onPressed: () {}),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black,
                      primary: Colors.white,
                      shape: StadiumBorder(),
                    ),
                    child: Image(
                      image: AssetImage("assets/icons/Talk.png"),
                      width: 30.0,
                      height: 30.0,
                      color: null,
                    ),
                    onPressed: () {}),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black,
                      primary: Colors.white,
                      shape: StadiumBorder(),
                    ),
                    child: Image(
                      image: AssetImage("assets/icons/Nostalgia.png"),
                      width: 30.0,
                      height: 30.0,
                      color: null,
                    ),
                    onPressed: () {}),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black,
                      primary: Colors.white,
                      shape: StadiumBorder(),
                    ),
                    child: Image(
                      image: AssetImage("assets/icons/Especial.png"),
                      width: 30.0,
                      height: 30.0,
                      color: null,
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        ));
  }

  Widget _cardLastEpis() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          constraints: BoxConstraints.expand(height: 170),
          child: Card(
            margin: EdgeInsets.zero,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )),
            color: Colors.blueAccent,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://sm.ign.com/ign_br/screenshot/default/doutor-estranho-multiverso-loucura_jmqu.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                  stops: [0.0, 1],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )),
              ),
            ),
          ),
        ),
        Positioned(
            top: 40,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ÚLTIMO EPISÓDIO',
                  style: GoogleFonts.raleway(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding:
                      EdgeInsets.only(top: 3, left: 5, right: 5, bottom: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Text(
                    "CríticaMais",
                    style: GoogleFonts.raleway(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            )),
        Container(padding: EdgeInsets.only(top: 160), child: _menu())
      ],
    );
  }

  Widget _containerEpisodios() {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 15,
              bottom: 10,
            ),
            child: Row(children: [
              Text("Episódio",
                  style: GoogleFonts.raleway(
                      fontSize: 16, fontWeight: FontWeight.w500)),
              Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text("Padrão",
                      style: GoogleFonts.raleway(
                          fontSize: 16, fontWeight: FontWeight.w800))),
            ])),
        Container(
            height: 250,
            child: SmartRefresher(
              enablePullDown: false,
              enablePullUp: true,
              controller: _controller,
              footer: ClassicFooter(
                iconPos: IconPosition.top,
                outerBuilder: (child) {
                  return Container(
                      width: 80.0,
                      child: Center(
                        child: child,
                      ));
                },
              ),
              header: ClassicHeader(
                iconPos: IconPosition.top,
                outerBuilder: (child) {
                  return Container(
                    width: 80,
                    child: Center(
                      child: child,
                    ),
                  );
                },
              ),
              onRefresh: _onLoading,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: itemsCount,
                separatorBuilder: (context, _) => SizedBox(
                  width: 8,
                ),
                itemBuilder: (context, index) =>
                    _cardEpisodios(item: items[index]),
              ),
            )),
      ]),
    );
  }

  Widget _cardEpisodios({
    required CardEp item,
  }) =>
      Container(
        padding: EdgeInsets.only(left: 10),
        child: GestureDetector(
          onTap: (() => Navigator.push(
              context, MaterialPageRoute(builder: (context) => PageEpisode()))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: SizedBox(
                      width: 150,
                      height: 150,
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            item.urlImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ))),
              Row(
                children: [
                  Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 10),
                          child: Text(
                            item.episode,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.raleway(
                                fontSize: 10, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: 7),
                          child: Text(
                            item.title,
                            style: GoogleFonts.raleway(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _gradeMovies() {
    return Container(
        height: 260,
        width: double.infinity,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Card(
                color: Color(0xFFFFFFFF),
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 120,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://sm.ign.com/ign_br/screenshot/default/doutor-estranho-multiverso-loucura_jmqu.jpg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 100,
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Dr Estranho\n',
                                          style: GoogleFonts.raleway(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF000000)),
                                        ),
                                        TextSpan(
                                          text: 'no Multiverso da Loucura',
                                          style: GoogleFonts.raleway(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF000000)),
                                        )
                                      ]),
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 18),
                                  child: Text('9.5/10',
                                      style: GoogleFonts.raleway(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Text('Avaliação',
                                  style: GoogleFonts.raleway(fontSize: 12))),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RatingBar.builder(
                                  minRating: 1,
                                  itemSize: 25,
                                  itemBuilder: (context, _) =>
                                      Icon(Icons.star, color: Colors.amber),
                                  onRatingUpdate: (rating) {}),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text('Votar'),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(110, 25),
                                    padding: EdgeInsets.zero,
                                    primary: Color(0xFF33CC99)),
                              )
                            ],
                          ),
                          Container(
                            width: 160,
                            height: 90,
                            margin: EdgeInsets.zero,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  dataString,
                                  style: TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(3, 2),
                                        primary: Color(0xFF33CC99)),
                                    onPressed: () {},
                                    child: Text(
                                      'Ler Mais',
                                      style: TextStyle(fontSize: 12),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}

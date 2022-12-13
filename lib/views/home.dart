import 'package:carousel_slider/carousel_slider.dart';
import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:defensa_civil/views/parallax.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  final imgListSlider = [
    'https://defensacivil.gob.do/images/banners/banner2022/COMISIONWEBBANNER.png',
    'https://defensacivil.gob.do/images/slide/2021/Carta%20Compromiso%20banner.png',
    // 'https://defensacivil.gob.do/images/slide/2021/Bannerprincipal_1.jpg',
    'https://defensacivil.gob.do/images/slide/2021/boletin_instirucional_SIN_BORDES.jpg',
    'https://defensacivil.gob.do/images/slide/2021/slider_escuela_2.jpg'
  ];

  final imgListLinks = [
    "https://www.elcaribe.com.do/wp-content/uploads/2021/01/c4d25cf5-sistema-9-1-1-en-accion-5ff3587a75cd0-1024x682.jpeg",
    "https://www.elcaribe.com.do/wp-content/uploads/2018/12/be447b50-palacio-nacional.jpg",
    "https://www.resumendesalud.net/images/Senada.jpeg",
  ];

  final nameListLinks = [
    "Servicio De Emergencias 911",
    "Presidencia De la República",
    "Portal Del Gobierno De La República"
  ];
  final links = [
    "https://911.gob.do/",
    "https://presidencia.gob.do/",
    "https://www.gob.do/"
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: NavBar(
          title: "Inicio",
        ),
        drawer: Menu(),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              margin: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "Avisos",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 165,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 6),
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                    itemCount: imgListSlider.length,
                    itemBuilder: ((context, index, realIndex) {
                      final imgL = imgListSlider[index];

                      return buildImage(imgL, index);
                    }),
                  ),
                ),
                buildIndicator()
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              margin: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "Enlaces de interés",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            for (int i = 0; i < imgListLinks.length; i++)
              ParallaxWidget(
                src: imgListLinks[i],
                title: nameListLinks[i],
                url: links[i],
              ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              margin: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "Únete a nuestro voluntariado",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ProgressiveImage(
                      placeholder: const AssetImage("images/placeholder.png"),
                      thumbnail: AssetImage("images/placeholder.png"),
                      image: NetworkImage(
                          "https://defensacivil.gob.do/templates/plantillasimple/images/FondopaginaWeb-01.png"),
                      height: 110,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        // margin: EdgeInsets.only(right: 220),
                        width: 340,
                        child: Text(
                          "¿Quieres ser voluntario para la",
                          style: TextStyle(
                              color: Colors.orange.shade900,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        // margin: EdgeInsets.only(right: 220),
                        width: 340,
                        child: Text(
                          "Defensa Civil?",
                          style: TextStyle(
                              color: Colors.blue.shade900,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: () {
                            GoRouter.of(context).go("/voluntario");
                          },
                          child: Text("Registrate"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).secondaryHeaderColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              margin: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                "Sigue nuestras redes sociales",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              margin: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                            "https://thumbs.dreamstime.com/b/colored-instagram-logo-icon-high-resolution-colored-instagram-logo-white-background-vector-eps-file-available-additional-175710005.jpg"),
                        backgroundColor: Colors.grey,
                      ),
                      onTap: () async {
                        await launchUrlString(
                            "https://www.instagram.com/defensacivilrd/?hl=es",
                            mode: LaunchMode.externalApplication);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                            "https://thumbs.dreamstime.com/b/facebook-logo-icon-voronezh-russia-november-round-blue-color-164585774.jpg"),
                        backgroundColor: Colors.grey,
                      ),
                      onTap: () async {
                        await launchUrlString(
                            "https://www.facebook.com/DefensaCivilRD/",
                            mode: LaunchMode.externalApplication);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                            "https://thumbs.dreamstime.com/b/high-resolution-colored-youtube-logo-white-background-vector-eps-file-available-additional-download-colored-youtube-logo-175730434.jpg"),
                        backgroundColor: Colors.grey,
                      ),
                      onTap: () async {
                        await launchUrlString(
                            "https://www.youtube.com/channel/UCGw_OxKurZHeXgtS_POR2Tw",
                            mode: LaunchMode.externalApplication);
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                            "https://thumbs.dreamstime.com/b/twitter-i-bird-logo-icon-vector-image-can-also-be-used-social-media-logos-suitable-mobile-apps-web-apps-print-media-81671126.jpg"),
                        backgroundColor: Colors.grey,
                      ),
                      onTap: () async {
                        await launchUrlString(
                            "https://twitter.com/defensacivilrd",
                            mode: LaunchMode.externalApplication);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );

  Widget buildImage(String imgL, int index) => Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ProgressiveImage(
            placeholder: const AssetImage("images/placeholder.png"),
            thumbnail: AssetImage("images/placeholder.png"),
            image: NetworkImage(imgL),
            height: 250,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: imgListSlider.length,
      effect: WormEffect(
          activeDotColor: Colors.orange.shade900, dotColor: Colors.black12));
}

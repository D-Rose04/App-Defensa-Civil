import 'package:carousel_slider/carousel_slider.dart';
import 'package:defensa_civil/layout/menu.dart';
import 'package:defensa_civil/layout/navbar.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  final imgList = [
    'https://pbs.twimg.com/media/FY8wP8qWYAEXdT4?format=jpg&name=small',
    'https://defensacivil.gob.do/images/publicaciones/Servicios/Rescate_en_Estrcuturas_Colapsadas_y_Espacios_Confinados_opt.jpg',
    'https://www.ultimasnoticias.com.do/wp-content/uploads/2020/12/43fc58e2-436c-4bb1-b3dd-653c7f1e89cc.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd6pvz8FvXxrnp1ZRZVgEWXdmOXvCPJmfgDA&usqp=CAU',
    'https://defensacivil.gob.do/media/zoo/images/x27_ea05a2db65ac1979b1bc447f3914d270.jpeg'
  ];


  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const NavBar(
        title: "Home",
      ),
      drawer: const Menu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 400,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
              itemCount: imgList.length,
              itemBuilder: ((context, index, realIndex) {
                final imgL = imgList[index];

                return buildImage(imgL, index);
              }),
            ),
            const SizedBox(height:  32,),
            buildIndicator(),
          ],
        ),
      ));

  Widget buildImage(String imgL, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          imgL,
          fit: BoxFit.cover,
        ),
      );
  
  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count:  imgList.length,
    effect: WormEffect(
      activeDotColor: Colors.orange.shade900,
      dotColor: Colors.black12
    )
  );
}

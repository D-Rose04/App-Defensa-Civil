import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../layout/menu.dart';
import '../layout/navbar.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: NavBar(
          title: "Acerca de",
        ),
        drawer: Menu(),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Participantes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 350,
                  height: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/rafa2.jpeg'),
                    radius: 40,
                  ),
                ),
                const Text(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                    textAlign: TextAlign.center,
                    'Rafael Cid'),
                const Text(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                    'Contactame:'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://web.telegram.org/z/icon-192x192.png"),
                          backgroundColor: Colors.grey,
                        ),
                        onTap: () async {
                          await launchUrlString("https://t.me/+18098558689",
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://cdn2.iconfinder.com/data/icons/2018-social-media-app-logos/1000/2018_social_media_popular_app_logo-whatsapp-512.png"),
                          backgroundColor: Colors.grey,
                        ),
                        onTap: () async {
                          await launchUrlString("https://wa.me/+18098558689",
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/736x/f8/bb/b9/f8bbb9feb0ed38330c464f813462ec8d--play-store-web-app-store.jpg"),
                          backgroundColor: Colors.grey,
                        ),
                        onTap: () async {
                          await launchUrlString("mailto:rafaelcid40@gmail.com",
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                    )
                  ],
                ),
                Container(
                  width: 350,
                  height: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/david.jpg'),
                    radius: 40,
                  ),
                ),
                const Text(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                    textAlign: TextAlign.center,
                    'David Hernández'),
                const Text(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                    'Contactame:'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://web.telegram.org/z/icon-192x192.png"),
                          backgroundColor: Colors.grey,
                        ),
                        onTap: () async {
                          await launchUrlString("https://t.me/+18098508898",
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://cdn2.iconfinder.com/data/icons/2018-social-media-app-logos/1000/2018_social_media_popular_app_logo-whatsapp-512.png"),
                          backgroundColor: Colors.grey,
                        ),
                        onTap: () async {
                          await launchUrlString("https://wa.me/+18098508898",
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/736x/f8/bb/b9/f8bbb9feb0ed38330c464f813462ec8d--play-store-web-app-store.jpg"),
                          backgroundColor: Colors.grey,
                        ),
                        onTap: () async {
                          await launchUrlString("mailto:davidbhr04@gmail.com",
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                    )
                  ],
                ),
                Container(
                  width: 350,
                  height: 250,
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/johan1.jpg'),
                    radius: 40,
                  ),
                ),
                const Text(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                    textAlign: TextAlign.center,
                    'Johan Ventura'),
                const Text(
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                    'Contactame:'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://web.telegram.org/z/icon-192x192.png"),
                          backgroundColor: Colors.grey,
                        ),
                        onTap: () async {
                          await launchUrlString("https://t.me/+18295397836",
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://cdn2.iconfinder.com/data/icons/2018-social-media-app-logos/1000/2018_social_media_popular_app_logo-whatsapp-512.png"),
                          backgroundColor: Colors.grey,
                        ),
                        onTap: () async {
                          await launchUrlString("https://wa.me/+18295397836",
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/736x/f8/bb/b9/f8bbb9feb0ed38330c464f813462ec8d--play-store-web-app-store.jpg"),
                          backgroundColor: Colors.grey,
                        ),
                        onTap: () async {
                          await launchUrlString("mailto:johanventura71@gmail.com",
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                    )
                  ],
                ),
              ]),
        )));
  }

  Future<void> _onOpen(LinkableElement link) async {
    // ignore: deprecated_member_use
    if (await canLaunch(link.url)) {
      // ignore: deprecated_member_use
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // ignore: prefer_const_literals_to_create_immutables
      child: ListView(children: [
        const UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: Text("Defensa Civil"),
            accountEmail: Text("809-472-8614 / 8617"),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "images/menu-background.jpeg",
                ),
                fit: BoxFit.fill,
              ),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("images/logo.png"),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:
                    AssetImage("images/escudo-de-republica-dominicana.jpg"),
              ),
            ]),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          title: Text("Inicio"),
          onTap: () {
            GoRouter.of(context).go('/');
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.history_edu_outlined,
              color: Theme.of(context).secondaryHeaderColor),
          title: const Text("Historia"),
          onTap: () {
            GoRouter.of(context).go('/historia');
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.room_service_rounded,
              color: Theme.of(context).secondaryHeaderColor),
          title: const Text("Servicios"),
          onTap: () {
            GoRouter.of(context).go('/servicios');
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.newspaper,
              color: Theme.of(context).secondaryHeaderColor),
          title: const Text("Noticias"),
          onTap: () {
            GoRouter.of(context).go('/noticias');
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.video_collection_rounded,
              color: Theme.of(context).secondaryHeaderColor),
          title: const Text("Videos"),
          onTap: () {
            GoRouter.of(context).go('/videos');
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading:
              Icon(Icons.hotel, color: Theme.of(context).secondaryHeaderColor),
          title: const Text("Albergues"),
          onTap: () {
            GoRouter.of(context).go('/albergues');
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.warning_amber_rounded,
              color: Theme.of(context).secondaryHeaderColor),
          title: const Text("Medidas preventivas"),
          onTap: () {
            GoRouter.of(context).go('/medidas');
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading:
              Icon(Icons.person, color: Theme.of(context).secondaryHeaderColor),
          title: const Text("Miembros"),
          onTap: () {
            GoRouter.of(context).go('/miembros');
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.volunteer_activism_rounded,
              color: Theme.of(context).secondaryHeaderColor),
          title: const Text("Quiero ser voluntario"),
          onTap: () {
            GoRouter.of(context).go('/voluntario');
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.camera_outdoor_outlined,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          title: const Text("Reportar una situación"),
          onTap: () {
            GoRouter.of(context).go('/reporta');
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading:
              Icon(Icons.info, color: Theme.of(context).secondaryHeaderColor),
          title: const Text("Acerca de"),
          onTap: () {
            GoRouter.of(context).go('/info');
            Navigator.pop(context);
          },
        )
      ]),
    );
  }
}

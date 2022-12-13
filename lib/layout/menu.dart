import 'package:defensa_civil/models/usuarios_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);
  static bool logged = false;
  static UsuarioModel? user;

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
        Menu.logged
            ? ListTile(
                leading: Icon(
                  Icons.camera_outdoor_outlined,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                title: const Text("Reportar una situación"),
                onTap: () {
                  GoRouter.of(context).go('/reporta');
                  Navigator.pop(context);
                },
              )
            : Text(""),
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
          leading:
              Icon(Icons.info, color: Theme.of(context).secondaryHeaderColor),
          title: const Text("Acerca de"),
          onTap: () {
            GoRouter.of(context).go('/info');
            Navigator.pop(context);
          },
        ),
        Menu.logged
            ? ListTile(
                tileColor: Colors.blue.shade900,
                iconColor: Colors.orange.shade900,
                textColor: Colors.white,
                leading: Icon(Icons.logout_rounded),
                title: Text("Cerrar sesion"),
                onTap: () {
                  setState(() {
                    Menu.logged = false;
                    Menu.user = null;
                    GoRouter.of(context).go('/inicio_sesion');
                    Navigator.pop(context);
                  });
                },
              )
            : ListTile(
                tileColor: Colors.blue.shade900,
                iconColor: Colors.orange.shade900,
                textColor: Colors.white,
                leading: Icon(Icons.login_rounded),
                title: Text("Iniciar sesion"),
                onTap: () {
                  GoRouter.of(context).go('/inicio_sesion');
                  Navigator.pop(context);
                },
              )
      ]),
    );
  }
}

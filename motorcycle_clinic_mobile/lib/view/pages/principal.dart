import 'package:flutter/material.dart';

import '../widgets/app_bar_menu.dart';
import '../widgets/drawer_admin.dart';

class Principal extends StatelessWidget {
  final String email;
  final String name;
  const Principal({super.key, required this.email, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 32.0,
              ),
              onPressed: () => Scaffold.of(context)
                  .openDrawer(), //función que llama al drawer.
            );
          },
        ),
        title: const Center(
          child: Text(
            "Principal",
            style: TextStyle(fontSize: 23.0),
          ),
        ),
        backgroundColor: const Color(0xff4D581C),
        actions: const <Widget>[
          AppBMenu(),
        ],
      ),
      drawer: const DrawerAdmin(),
    );
  }
}

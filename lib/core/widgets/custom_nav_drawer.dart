import 'package:flutter/material.dart';

class CustomNavDrawer extends StatelessWidget {
  const CustomNavDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Principal'),
            onTap: () => {
              Navigator.of(context).pushNamed(
                '/'
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Categorias'),
            onTap: () => {
              Navigator.of(context).pushNamed(
                '/listacategorias/'
              )
            },
          ),
        ],
      ),
    );
  }
}
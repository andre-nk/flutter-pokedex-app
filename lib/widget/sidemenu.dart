import 'package:flutter/material.dart';
import 'package:pokedex/pages/pokedex.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset('assets/img/pokedex.png'),
            decoration: BoxDecoration(
              color: Colors.red[300]
            ),
          ),

          ListTile(
            leading: Icon(Icons.games),
            title: Text('Kanto'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PokedexPage(pokedexId: 1)),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.games),
            title: Text('Johto'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PokedexPage(pokedexId: 2)),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.games),
            title: Text('Hoenn'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PokedexPage(pokedexId: 3)),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.games),
            title: Text('Sinnoh'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PokedexPage(pokedexId: 4)),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.games),
            title: Text('Unova'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PokedexPage(pokedexId: 5)),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.games),
            title: Text('Kalos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PokedexPage(pokedexId: 6)),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.games),
            title: Text('Alola'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PokedexPage(pokedexId: 7)),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.games),
            title: Text('Galar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PokedexPage(pokedexId: 8)),
              );
            },
          ),
        ],
      ),
    );
  }
}

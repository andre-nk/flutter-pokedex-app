import 'package:flutter/material.dart';
import 'package:pokedex/models/pokedex.dart';
import 'package:pokedex/services/pokedex_service.dart';
import 'package:pokedex/widget/pokemon_item.dart';

class PokedexPage extends StatefulWidget {
  @override
  _PokedexPageState createState() => _PokedexPageState();

  PokedexPage({Key key, this.pokedexId}) : super(key: key);

  final int pokedexId;
}

class _PokedexPageState extends State<PokedexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokedex',
          style: TextStyle(
            fontWeight: FontWeight.w700
          ),
        ),
      ),
      backgroundColor: Colors.grey[850],
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: PokedexService.getPokedex(name: widget.pokedexId.toString()),
          builder: (_builder, _snapshot) {
            if (_snapshot.hasData) {
              Pokedex pokedex = _snapshot.data;
              return CustomScrollView(
                slivers: [
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext __context, int index) {
                        return FutureBuilder(
                          future: PokedexService.getPokemon(name: pokedex.pokemon[index].id.toString()),
                          builder: (BuildContext ___context, ___snapshot) {
                            if (___snapshot.hasData) {
                              return PokemonItemWidget(pokemon: ___snapshot.data);
                            }

                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 32.0),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          },
                        );
                      },
                      childCount: 9,
                    ),
                  )
                ],
              );
            }

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 32.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        ),
      ),
    );
  }
}

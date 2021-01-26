import 'package:flutter/material.dart';
import 'package:pokedex/models/pokedex.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/pokedex_service.dart';
import 'package:pokedex/widget/pokemon_item.dart';
import 'package:pokedex/widget/sidemenu.dart';

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
        backgroundColor: Colors.red[300],
        title: Text(
          'Pokedex',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      drawer: SideMenu(),
      backgroundColor: Colors.grey[850],
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: FutureBuilder(
            future: PokedexService.getPokedex(widget.pokedexId),
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
                            future: PokedexService.getPokemon(
                                name: pokedex.pokemon[index].name),
                            builder: (BuildContext ___context, ___snapshot) {
                              if (___snapshot.hasError) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 32.0),
                                  child: Center(
                                    child: Icon(
                                      Icons.error_outline,
                                      color: Colors.grey[600],
                                      size: 48.0,
                                    ),
                                  ),
                                );
                              }

                              if (___snapshot.hasData) {
                                return PokemonItemWidget(
                                    pokemon: ___snapshot.data);
                              }

                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 32.0),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.red[300]),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        childCount: pokedex.pokemon.length,
                      ),
                    )
                  ],
                );
              }

              if (_snapshot.hasError) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Center(
                      child: Icon(
                    Icons.error_outline,
                    color: Colors.grey[600],
                    size: 48.0,
                  )),
                );
              }

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red[300]),
                )),
              );
            }),
      ),
    );
  }
}

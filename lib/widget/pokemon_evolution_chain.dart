import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/pokemon.dart';
import 'package:pokedex/services/pokedex_service.dart';

class EvolutionChainWidget extends StatefulWidget {
  final Pokemon pokemon;

  const EvolutionChainWidget({
    Key key,
    this.pokemon,
  }) : super(key: key);

  @override
  _EvolutionChainWidgetState createState() => _EvolutionChainWidgetState();
}

class _EvolutionChainWidgetState extends State<EvolutionChainWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PokedexService.getEvolutionChain(
        chainId: widget.pokemon.evolutionChainId,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<List<Pokemon>> chain = snapshot.data;

          return Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _mountChain(chain),
            ),
          );
        }

        return Container();
      },
    );
  }

  _mountChain(List<List<Pokemon>> chain) {
    List<Widget> chainList = [];

    int index = 0;

    chain.forEach((evolutionStage) {
      chainList.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: evolutionStage
              .map(
                (Pokemon pokemon) => GestureDetector(
                  onTap: () {
                    if (widget.pokemon.name != pokemon.name) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PokemonPage(pokemon: pokemon),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(pokemon.artwork),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: Image.network(pokemon.artwork),
                  ),
                ),
              )
              .toList(),
        ),
      );

      if (index != chain.length - 1) {
        chainList.add(
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Transform.rotate(
              angle: pi / 2,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey.shade400,
                size: 30,
              ),
            ),
          ),
        );
      }

      index++;
    });

    return chainList;
  }
}

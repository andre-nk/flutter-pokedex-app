import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/string_extension.dart';
import 'package:pokedex/widget/pokemon_stats.dart';
import 'package:pokedex/widget/pokemon_types.dart';

class PokemonPage extends StatefulWidget {
  @override
  _PokemonPageState createState() => _PokemonPageState();

  PokemonPage({Key key, this.pokemon}) : super(key: key);

  final Pokemon pokemon;
}

class _PokemonPageState extends State<PokemonPage> {

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  child: Text(
                    '#' + widget.pokemon.id.toString() + ' ' + widget.pokemon.name.capitalize(),
                    style: TextStyle(
                      fontSize: 18.0
                    ),
                  ),
                  alignment: Alignment.center,
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: EdgeInsets.only(top: statusBarHeight),
                child: Hero(
                  child: Image.network(
                    widget.pokemon.artwork,
                    fit: BoxFit.fitHeight,
                  ),
                  tag: 'pokemon_image_' + widget.pokemon.name
                ),
              )
            ),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80)
              )
            ),
            expandedHeight: 200.0 + statusBarHeight,
            backgroundColor: widget.pokemon.rgb.length > 0
              ? Color.fromARGB(255, widget.pokemon.rgb[0], widget.pokemon.rgb[1], widget.pokemon.rgb[2])
              : Colors.white,
          ),

          SliverToBoxAdapter(
            child: PokemonTypesWidget(types: widget.pokemon.types)
          ),


          SliverToBoxAdapter(
            child: PokemonStatsWidget(
              stats: widget.pokemon.stats,
              color: Color.fromARGB(255, widget.pokemon.rgb[0], widget.pokemon.rgb[1], widget.pokemon.rgb[2])
            )
          ),
        ],
      ),
    );
  }

  _buildDataTableMoves() {
    List<DataRow> movesList = [];

    for (var i = 0; i < widget.pokemon.moves.length; i++) {
      movesList.add(DataRow(cells: [
        DataCell(Text('-')),
        DataCell(Text(widget.pokemon.moves[i]['move']['name'])),
        DataCell(Text('')),
      ]));
    }

    return movesList;
  }
}

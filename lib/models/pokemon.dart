import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/models/sprites.dart';
import 'package:pokedex/models/stat.dart';

part 'pokemon.g.dart';

@JsonSerializable(explicitToJson: true)
class Pokemon {
  const Pokemon({
    this.id,
    this.name,
    this.abilities,
    this.baseExperience,
    this.sprites,
    this.stats,
    this.types,
    this.rgb,
    this.artwork,
    this.moves
  });

  final int id;

  final String name;

  final List abilities;

  @JsonKey(name: 'base_experience')
  final int baseExperience;

  final Sprites sprites;

  final List<Stat> stats;

  final List types;

  final List rgb;

  final String artwork;

  final List moves;

  static Map colorsTemplate = {
    'bug': Color.fromARGB(255, 168, 184, 32),
    'dark': Color.fromARGB(255, 112, 88, 72),
    'dragon': Color.fromARGB(255, 112, 56, 248),
    'electric': Color.fromARGB(255, 248, 208, 48),
    'fairy': Color.fromARGB(255, 238, 153, 172),
    'fighting': Color.fromARGB(255, 192, 48, 40),
    'fire': Color.fromARGB(255, 240, 128, 48),
    'flying': Color.fromARGB(255, 168, 144, 240),
    'ghost': Color.fromARGB(255, 112, 88, 152),
    'grass': Color.fromARGB(255, 120, 200, 80),
    'ground': Color.fromARGB(255, 224, 192, 104),
    'ice': Color.fromARGB(255, 152, 216, 216),
    'normal': Color.fromARGB(255, 168, 168, 120),
    'poison': Color.fromARGB(255, 160, 64, 160),
    'psychic': Color.fromARGB(255, 248, 88, 136),
    'rock': Color.fromARGB(255, 184, 160, 56),
    'steel': Color.fromARGB(255, 184, 184, 208),
    'water': Color.fromARGB(255, 104, 144, 240),
  };

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

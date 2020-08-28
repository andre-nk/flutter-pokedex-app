// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    id: json['id'] as int,
    name: json['name'] as String,
    abilities: json['abilities'] as List,
    baseExperience: json['base_experience'] as int,
    sprites: json['sprites'] == null
        ? null
        : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
    stats: (json['stats'] as List)
        ?.map(
            (e) => e == null ? null : Stat.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    types: json['types'] as List,
    rgb: json['rgb'] as List,
    artwork: json['artwork'] as String,
    moves: json['moves'] as List,
    pokedexFlavorEntry: json['pokedex_flavor_entry'] as String,
  );
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abilities': instance.abilities,
      'base_experience': instance.baseExperience,
      'sprites': instance.sprites?.toJson(),
      'stats': instance.stats?.map((e) => e?.toJson())?.toList(),
      'types': instance.types,
      'rgb': instance.rgb,
      'artwork': instance.artwork,
      'moves': instance.moves,
      'pokedex_flavor_entry': instance.pokedexFlavorEntry,
    };

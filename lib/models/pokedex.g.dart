// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokedex _$PokedexFromJson(Map<String, dynamic> json) {
  return Pokedex(
    name: json['name'] as String,
    pokemon: (json['pokemon_entries'] as List)
        ?.map((e) => e == null
            ? null
            : PokedexPokemon.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PokedexToJson(Pokedex instance) => <String, dynamic>{
      'name': instance.name,
      'pokemon_entries': instance.pokemon?.map((e) => e?.toJson())?.toList(),
    };

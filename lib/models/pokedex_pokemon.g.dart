// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokedexPokemon _$PokedexPokemonFromJson(Map<String, dynamic> json) {
  return PokedexPokemon(
    id: json['entry_number'] as int,
    data: json['pokemon_species'] == null
        ? null
        : PokedexPokemonData.fromJson(
            json['pokemon_species'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PokedexPokemonToJson(PokedexPokemon instance) =>
    <String, dynamic>{
      'entry_number': instance.id,
      'pokemon_species': instance.data?.toJson(),
    };

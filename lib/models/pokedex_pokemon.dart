import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/models/pokedex_pokemon_data.dart';

part 'pokedex_pokemon.g.dart';

@JsonSerializable(explicitToJson: true)
class PokedexPokemon {
  const PokedexPokemon({
    this.id,
    this.data
  });

  @JsonKey(name: 'entry_number')
  final int id;

  @JsonKey(name: 'pokemon_species')
  final PokedexPokemonData data;

  factory PokedexPokemon.fromJson(Map<String, dynamic> json) => _$PokedexPokemonFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexPokemonToJson(this);
}

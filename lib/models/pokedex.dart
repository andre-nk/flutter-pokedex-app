import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/models/pokedex_pokemon.dart';

part 'pokedex.g.dart';

@JsonSerializable(explicitToJson: true)
class Pokedex {
  const Pokedex({
    this.name,
    this.pokemon
  });

  final String name;

  @JsonKey(name: 'pokemon_entries')
  final List<PokedexPokemon> pokemon;

  factory Pokedex.fromJson(Map<String, dynamic> json) => _$PokedexFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexToJson(this);
}

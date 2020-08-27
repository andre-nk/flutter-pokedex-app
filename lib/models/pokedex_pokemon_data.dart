import 'package:json_annotation/json_annotation.dart';

part 'pokedex_pokemon_data.g.dart';

@JsonSerializable(explicitToJson: true)
class PokedexPokemonData {
  const PokedexPokemonData({
    this.name,
    this.url
  });

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'url')
  final String url;

  factory PokedexPokemonData.fromJson(Map<String, dynamic> json) => _$PokedexPokemonDataFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexPokemonDataToJson(this);
}

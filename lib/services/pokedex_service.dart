import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/config/env.dart';
import 'package:pokedex/models/pokedex.dart';
import 'package:pokedex/models/pokemon.dart';

class PokedexService {
  static getPokedex({String name}) async {
    try {
      final String url = 'https://pokeapi.co/api/v2/pokedex/$name/';
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Pokedex pokedex = Pokedex.fromJson(json.decode(response.body));

        return pokedex;
      }
    } catch (e) {
      if (e is Error) {
        print(e.stackTrace);
        return Error;
      }

      print(e);
    }
  }

  static getPokemon({String name}) async {
    try {
      final String url = 'https://us-central1-image-dominant-color.cloudfunctions.net/getPokemonFromPokedexApi';
      final response = await http.post(url, body: {
        'pokemon': name,
	      'token': Env.dominantImageAccessToken
      });

      if (response.statusCode == 200) {
        final Pokemon pokemon = Pokemon.fromJson(json.decode(response.body));

        return pokemon;
      }
    } catch (e) {
      if (e is Error) {
        print(e.stackTrace);
        return Error;
      }

      print(e);
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/utils/string_extension.dart';
import 'package:pokedex/models/pokedex.dart';
import 'package:pokedex/models/pokemon.dart';

class PokedexService {
  static getPokedex(id) async {
    try {
      final String url =
          'https://us-central1-image-dominant-color.cloudfunctions.net/getPokedexByGenerationFromPokedexApi';
      final response = await http.post(url, body: {'regionId': id.toString()});

      if (response.statusCode == 200) {
        final Pokedex pokedex = Pokedex.fromJson(json.decode(response.body));

        return pokedex;
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Error getting Pokemon from this Pokedex, try again later!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      if (e is Error) {
        print(e.stackTrace);
        return Error;
      }

      print('Error getPokedex -> $e');
    }
  }

  static getPokemon({String name}) async {
    try {
      final String url =
          'https://us-central1-image-dominant-color.cloudfunctions.net/getPokemonFromPokedexApi';
      final response = await http.post(url, body: {'pokemon': name});

      if (response.statusCode == 200) {
        final Pokemon pokemon = Pokemon.fromJson(json.decode(response.body));

        return pokemon;
      }
    } catch (e) {
      if (e is Error) {
        Fluttertoast.showToast(
            msg: "Error on getting info about ${name.capitalize()}.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        return Error;
      }

      print('Error getPokemon -> $e');
    }
  }

  static Future<List<List<Pokemon>>> getEvolutionChain({int chainId}) async {
    try {
      final String url =
          'https://us-central1-image-dominant-color.cloudfunctions.net/getPokemonEvolutionaryChain';
      final response = await http.post(url, body: {'chainId': chainId});
      final List<List> responseBody = json.decode(response.body);
      final List<List<Pokemon>> pokemonEvolutions = [];

      int i = 0;
      int j = 0;

      responseBody.forEach((chain) {
        pokemonEvolutions.add([]);
        chain.forEach((pokemon) {
          pokemonEvolutions[i]
              .add(Pokemon.fromJson(json.decode(responseBody[i][j])));
        });
      });

      return pokemonEvolutions;
    } catch (e) {
      if (e is Error) {
        Fluttertoast.showToast(
            msg: "Error on getting info about evolutions.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);

        return null;
      }
    }

    return null;
  }
}

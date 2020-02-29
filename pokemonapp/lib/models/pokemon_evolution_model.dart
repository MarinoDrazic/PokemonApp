// To parse this JSON data, do
//
//     final pokemonEvolutionModel = pokemonEvolutionModelFromJson(jsonString);

import 'dart:convert';

PokemonEvolutionModel pokemonEvolutionModelFromJson(String str) =>
    PokemonEvolutionModel.fromJson(json.decode(str));

String pokemonEvolutionModelToJson(PokemonEvolutionModel data) =>
    json.encode(data.toJson());

class PokemonEvolutionModel {
  dynamic babyTriggerItem;
  Chain chain;
  int id;

  PokemonEvolutionModel({
    this.babyTriggerItem,
    this.chain,
    this.id,
  });

  factory PokemonEvolutionModel.fromJson(Map<String, dynamic> json) =>
      PokemonEvolutionModel(
        babyTriggerItem: json["baby_trigger_item"],
        chain: json["chain"] == null ? null : Chain.fromJson(json["chain"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "baby_trigger_item": babyTriggerItem,
        "chain": chain == null ? null : chain.toJson(),
        "id": id == null ? null : id,
      };
}

class Chain {
  List<EvolutionDetail> evolutionDetails;
  List<Chain> evolvesTo;
  bool isBaby;
  Species species;

  Chain({
    this.evolutionDetails,
    this.evolvesTo,
    this.isBaby,
    this.species,
  });

  factory Chain.fromJson(Map<String, dynamic> json) => Chain(
        evolutionDetails: json["evolution_details"] == null
            ? null
            : List<EvolutionDetail>.from(json["evolution_details"]
                .map((x) => EvolutionDetail.fromJson(x))),
        evolvesTo: json["evolves_to"] == null
            ? null
            : List<Chain>.from(
                json["evolves_to"].map((x) => Chain.fromJson(x))),
        isBaby: json["is_baby"] == null ? null : json["is_baby"],
        species:
            json["species"] == null ? null : Species.fromJson(json["species"]),
      );

  Map<String, dynamic> toJson() => {
        "evolution_details": evolutionDetails == null
            ? null
            : List<dynamic>.from(evolutionDetails.map((x) => x.toJson())),
        "evolves_to": evolvesTo == null
            ? null
            : List<dynamic>.from(evolvesTo.map((x) => x.toJson())),
        "is_baby": isBaby == null ? null : isBaby,
        "species": species == null ? null : species.toJson(),
      };
}

class EvolutionDetail {
  dynamic gender;
  dynamic heldItem;
  dynamic item;
  dynamic knownMove;
  dynamic knownMoveType;
  dynamic location;
  dynamic minAffection;
  dynamic minBeauty;
  dynamic minHappiness;
  int minLevel;
  bool needsOverworldRain;
  dynamic partySpecies;
  dynamic partyType;
  dynamic relativePhysicalStats;
  String timeOfDay;
  dynamic tradeSpecies;
  Species trigger;
  bool turnUpsideDown;

  EvolutionDetail({
    this.gender,
    this.heldItem,
    this.item,
    this.knownMove,
    this.knownMoveType,
    this.location,
    this.minAffection,
    this.minBeauty,
    this.minHappiness,
    this.minLevel,
    this.needsOverworldRain,
    this.partySpecies,
    this.partyType,
    this.relativePhysicalStats,
    this.timeOfDay,
    this.tradeSpecies,
    this.trigger,
    this.turnUpsideDown,
  });

  factory EvolutionDetail.fromJson(Map<String, dynamic> json) =>
      EvolutionDetail(
        gender: json["gender"],
        heldItem: json["held_item"],
        item: json["item"],
        knownMove: json["known_move"],
        knownMoveType: json["known_move_type"],
        location: json["location"],
        minAffection: json["min_affection"],
        minBeauty: json["min_beauty"],
        minHappiness: json["min_happiness"],
        minLevel: json["min_level"] == null ? null : json["min_level"],
        needsOverworldRain: json["needs_overworld_rain"] == null
            ? null
            : json["needs_overworld_rain"],
        partySpecies: json["party_species"],
        partyType: json["party_type"],
        relativePhysicalStats: json["relative_physical_stats"],
        timeOfDay: json["time_of_day"] == null ? null : json["time_of_day"],
        tradeSpecies: json["trade_species"],
        trigger:
            json["trigger"] == null ? null : Species.fromJson(json["trigger"]),
        turnUpsideDown:
            json["turn_upside_down"] == null ? null : json["turn_upside_down"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "held_item": heldItem,
        "item": item,
        "known_move": knownMove,
        "known_move_type": knownMoveType,
        "location": location,
        "min_affection": minAffection,
        "min_beauty": minBeauty,
        "min_happiness": minHappiness,
        "min_level": minLevel == null ? null : minLevel,
        "needs_overworld_rain":
            needsOverworldRain == null ? null : needsOverworldRain,
        "party_species": partySpecies,
        "party_type": partyType,
        "relative_physical_stats": relativePhysicalStats,
        "time_of_day": timeOfDay == null ? null : timeOfDay,
        "trade_species": tradeSpecies,
        "trigger": trigger == null ? null : trigger.toJson(),
        "turn_upside_down": turnUpsideDown == null ? null : turnUpsideDown,
      };
}

class Species {
  String name;
  String url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}

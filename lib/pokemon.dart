import 'dart:convert';
class Pokemons {
  List<BasePokemon> pokemob = [];


  Pokemons.fromJson(List<dynamic> json) {
    if (json == null) return;

    json.forEach((item) {
      final pokemon = BasePokemon.fromJson(item);
      pokemob.add(pokemon);
    });
  }
}

class BasePokemon {
  
  BasePokemon({
    this.name,
    this.url,
  });
  
  String name;
  String url;


  factory BasePokemon.fromJson(Map<String, dynamic> json) {
    return BasePokemon(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {"name": name, "url": url};
}

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

class Pokemon {
   
    Pokemon({
    this.id,
    this.name,
    this.weight, 
    this.height,
    this.sprites,
    this.stats,
    this.types,
  });
  
  int id;
  String name;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;
  int weight;
  int height;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    id: json["id"],
    name: json["name"],
    weight: json["weight"],
    height: json["height"],
    stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
    types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
    sprites: Sprites.fromJson(json["sprites"]),
  );


}

class Species {
  String name;
  String url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class Sprites {
  String backDefault;
  String frontDefault;

  Sprites({
    this.backDefault,
    this.frontDefault,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
    backDefault: json["back_default"],
    frontDefault: json["front_default"],
  );
}

class Stat {
  int status;
  Species stat;
  Stat({
    this.status,
    this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
    status: json["base_stat"],
    stat: Species.fromJson(json["stat"]),
  );
}

class Type {
  int slot;
  Species type;

  Type({
    this.slot,
    this.type,
  });
  factory Type.fromJson(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: Species.fromJson(json["type"]),
  );
}
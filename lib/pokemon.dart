import 'dart:convert';
class Pokemons {
  List<Base> pokemob = [];


  Pokemons.fromJson(List<dynamic> json) {
    if (json == null) return;

    json.forEach((item) {
      final pokemon = Base.fromJson(item);
      pokemob.add(pokemon);
    });
  }
}

class Base {
  
  Base({
    this.name,
    this.url,
  });
  
  String name;
  String url;


  factory Base.fromJson(Map<String, dynamic> json) {
    return Base(
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
  Species type;

  Type({
    this.type,
  });
  factory Type.fromJson(Map<String, dynamic> json) => Type( 
    type: Species.fromJson(json["type"]),
  );
}
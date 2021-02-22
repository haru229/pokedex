import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemon.dart';
import 'pokemon halaman 2.dart';


void main() {
  runApp(MyApp());
}

class HomeP extends StatefulWidget {
  static const String url =  'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Cards extends StatefulWidget {

  const Cards({Key key , this.pokeURL}) : super(key: key);
  final String pokeURL;
  
 
  @override
  _PokeCardState createState() => _PokeCardState();
}

class _PokeCardState extends State<Cards> {
  Pokemon pokemon;

  _fetchData() async{
    final response = await http.get(widget.pokeURL);
    final decode = json.decode(response.body);
    final data = Pokemon.fromJson(decode);
    setState(() {
      pokemon = data;
    });
  }



  void initState(){
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
      child:  Card(
            shape: StadiumBorder(
              side:BorderSide(color:Colors.blueGrey[900], width:8)
            ),
            color: Colors.blueGrey,
            child: InkWell(
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => Detailpokemon(pokemon)));
              },
              child: pokemon == null ? Center(
                child: CircularProgressIndicator(),
              ) : Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  Image.network(pokemon.sprites.frontDefault,
                    width: 140,
                    fit: BoxFit.fill,

                  ),

                  Text(pokemon.name,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2 ),)
                  ],),)
                 ),);
  }
}

class MyApp extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: "Pokedex",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomeP()
    );
  }
}

class _MyHomePageState extends State<HomeP> {
  Pokemons pokemons;

Future<List<Pokemons>> _fetchData() async{
   final response = await http.get(HomeP.url);
   final decode = json.decode(response.body);
   final data = Pokemons.fromJson(decode['results']);
   print(data.pokemob);
    setState(() {
      pokemons = data;
    });
    return _fetchData();
  }
  void initState(){
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text("Pokedex"),
        centerTitle: true,
      ),
      body: Container(
            child:
            pokemons == null ?
            Center(
              child: CircularProgressIndicator(),
            )
                : GridView.count(
                  crossAxisCount : 3,
              children: List.generate(pokemons.pokemob.length,
                      (index) =>
                          Cards(
                    pokeURL: pokemons.pokemob[index].url,
                  )),
            ),
          ),


      );

  }
}




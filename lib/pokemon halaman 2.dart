import 'package:flutter/material.dart';
import 'pokemon.dart';


///THIS CONTAIN DETAIL OF EVERY POKEMON
// ignore: must_be_immutable
class Detailpokemon extends StatelessWidget {
  Pokemon pokemon;

  
  Detailpokemon(this.pokemon);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        title: Text("Pokedex"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[600],

      ),
      body: Column(
        children: <Widget> [
          Stack(
            alignment: Alignment.center,
            children:  [
              
              Positioned(
                child:Image(image: NetworkImage(pokemon.sprites.frontDefault), 
                fit: BoxFit.fill,
                width: 500,
                height: 500,
              ),)
            ],
          ),
          SizedBox(height: 0),
          Text(pokemon.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: Colors.white,
                letterSpacing: 3,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(10,5,0,0),
            child: Text('TYPE : ', style: TextStyle
            (color: Colors.white,fontSize: 40, fontWeight: FontWeight.bold, letterSpacing: 2,),),
          ),
          Expanded(
            flex:0,
            child: Container(
              height:150,
              child: ListView.builder(
                  itemCount: pokemon.types.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,

                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(horizontal: 300,vertical: 1),
                      
                      child: Text(pokemon.types[index].type.name,style: TextStyle(color: Colors.white,fontSize: 30),),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey[600],
                          ),);
                  }),
            ),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('${pokemon.weight/10}', //berat dalam bentuk kilogram
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,)
                  ),
                  Text('Weight', //tinggi dalam bentuk cm
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,)  
                  ),
                ],
              ),
              Column(
                children: [
                  Text('${pokemon.height *10}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,)
                  ),
                  Text('Height',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,)
                  ),
                ],
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,20,0,0),
            child: Text("Status Info",
              style: TextStyle(
                  
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                  
                  letterSpacing: 2
              ),
              
            ),
          ),
          
          Expanded(
            child: ListView.builder(
                itemCount: pokemon.stats.length,
                itemBuilder: (context,index){
                  final poke = pokemon.stats[index];
                  
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Row(
                      children: [
                        Text('${poke.stat.name} = ${poke.status}',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2

                          ),
                        ),
                        SizedBox(height: 30)
                      ],
                    ),
                  );
                }
            ),
          )




        ],
      ),

    );
  }
}


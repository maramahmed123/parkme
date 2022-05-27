import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  const MyList({
    Key? key,
    
    required this.name,
    
  }) : super(key: key);

  final String name;
  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black54,
      child: Column(
        children: [
          ListTile(
            title: Text(name),
            
            
          ),
          
          
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return MyList(
                
                name: allTiles[index].name,
                
              );
            },
            // separatorBuilder: (context, index) {
            //   return SizedBox(
            //     height: 10,
            //   );
            // },
            itemCount: allTiles.length,
          ),
        ),
      ),
    );
  }
}

List<Tile> allTiles = [
  Tile(
    name: "72 75 2A 11 CF 31 19 19",
    
  ),
  Tile(
    name: "15 00 00 00 00 00 00 00",
    
  ),
  Tile(
    name: "02 40 A1 E3 25 63 B7 3F",),
  Tile(
    name: "72 75 2A 11 CF 31 19 19",
    
  ),
  Tile(
    name: "15 00 00 00 00 00 00 00",
    
  ),
  Tile(
    name: "02 40 A1 E3 25 63 B7 3F",),
      Tile(
    name: "72 75 2A 11 CF 31 19 19",
    
  ),
  Tile(
    name: "15 00 00 00 00 00 00 00",
    
  ),
  Tile(
    name: "02 40 A1 E3 25 63 B7 3F",),
      Tile(
    name: "72 75 2A 11 CF 31 19 19",
    
  ),
  Tile(
    name: "02 40 A1 E3 25 63 B7 3F",
    
  ),
  Tile(
    name: "02 40 A1 E3 25 63 B7 3F",),
      Tile(
    name: "72 75 2A 11 CF 31 19 19",
    
  ),
  Tile(
    name: "15 00 00 00 00 00 00 00",
    
  ),
  Tile(
    name: "02 40 A1 E3 25 63 B7 3F",),
      Tile(
    name: "72 75 2A 11 CF 31 19 19",
    
  ),
  Tile(
    name: "15 00 00 00 00 00 00 00",
    
  ),
  Tile(
    name: "02 40 A1 E3 25 63 B7 3F",),
      Tile(
    name: "72 75 2A 11 CF 31 19 19",
    
  ),
  Tile(
    name: "15 00 00 00 00 00 00 00",
    
  ),
  Tile(
    name: "02 40 A1 E3 25 63 B7 3F",),
      Tile(
    name: "72 75 2A 11 CF 31 19 19",
    
  ),
  Tile(
    name: "02 40 A1 E3 25 63 B7 3F",
    
  ),
  Tile(
    name: "02 40 A1 E3 25 63 B7 3F",),
  Tile(
    name: "24 68 AA 36 AA 97 53 94",
    
  ),
  Tile(
    name: "15 00 00 00 00 00 00 00",
    
  ),
  Tile(
    name: "02 40 A1 E3 25 63 B7 3F",),
      Tile(
    name: "72 75 2A 11 CF 31 19 19",
    
  ),
  Tile(
    name: "15 00 00 00 00 00 00 00",
    
  ),
  Tile(
    name: "02 40 A1 E3 25 63 B7 3F",),
      Tile(
    name: "72 75 2A 11 CF 31 19 19",
    
  ),
  Tile(
    name: "15 00 00 00 00 00 00 00",
    
  ),
  Tile(
    name: "24 68 22 00 22 97 53 00",),

  
    
];

class Tile {
  
  

  String name;
  
  Tile(
      {required this.name,
      });
}

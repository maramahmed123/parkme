
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(  
        title: Text("parking map"),  
        backgroundColor: Colors.green,  
      ),  
      body: Center(  
          child: GridView.builder(
            gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent( 
              
              
              crossAxisSpacing: 10,  
             mainAxisSpacing: 10,  
             maxCrossAxisExtent: 200.0,
               ),
            // primary: false,  
            
itemCount: 100,
            itemBuilder: (context , index){

              return Container(  
                padding:  EdgeInsets.all(8),  
                child:  Center(child: Text(index.toString(), style: TextStyle(fontSize: 22,
                color: Colors.white))),  
                color: Colors.green,  
              );
            }
            // children: <Widget>[  
            //   Container(  
            //     padding: const EdgeInsets.all(8),  
            //     child: const Text('1', style: TextStyle(fontSize: 20)),  
            //     color: Colors.green,  
            //   ),  
            //   Container(  
            //     padding: const EdgeInsets.all(8),  
            //     child: const Text('2', style: TextStyle(fontSize: 20)),  
            //     color: Colors.green,  
            //   ),  
            //   Container(  
            //     padding: const EdgeInsets.all(8),  
            //     child: const Text('3', style: TextStyle(fontSize: 20)),  
            //     color: Colors.red,  
            //   ),  
            //   Container(  
            //     padding: const EdgeInsets.all(8),  
            //     child: const Text('4', style: TextStyle(fontSize: 20)),  
            //     color: Colors.red,  
            //   ),  
            //   Container(  
            //     padding: const EdgeInsets.all(8),  
            //     child: const Text('5', style: TextStyle(fontSize: 20)),  
            //     color: Colors.red,  
            //   ),  
            //   Container(  
            //     padding: const EdgeInsets.all(8),  
            //     child: const Text('6', style: TextStyle(fontSize: 20)),  
            //     color: Colors.green,  
            //   ),  
            //   Container(  
            //     padding: const EdgeInsets.all(8),  
            //     child: const Text('7', style: TextStyle(fontSize: 20)),  
            //     color: Colors.red,  
            //   ),  
            //   Container(  
            //     padding: const EdgeInsets.all(8),  
            //     child: const Text('8', style: TextStyle(fontSize: 20)),  
            //     color: Colors.red,  
            //   ),
            //     Container(  
            //     padding: const EdgeInsets.all(8),  
            //     child: const Text('9', style: TextStyle(fontSize: 20)),  
            //     color: Colors.red,  
            //   ),  
            //   Container(  
            //     padding: const EdgeInsets.all(8),  
            //     child: const Text('10', style: TextStyle(fontSize: 20)),  
            //     color: Colors.green,  
            //   ),

            // ],  
          )
          
          ),  
    );
  }
}
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/catalog.dart';
import 'cart.dart';
class detailpage extends StatefulWidget {
  
  final String image;
  final String name;
 
  

  const detailpage({Key? key,required this.name, required this.image}) : super(key: key);

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  TextEditingController total = TextEditingController();
   static  int _n = 0;
    void add() {
  setState(() {
    _n++;
  });
}

void minus() {
  setState(() {
 if(_n!=0)
    _n--;
  });
}
  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      appBar: AppBar(



        
        title:Text(widget.name),
           actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.card_travel,
        color: Colors.white,
      ),
      onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) =>  cartpage()),);
      },
    ),
  ],
        ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
        child: Column(
            children: [
              Container(
                child: Column(
                  children:[
                    Container(
                      height: 200,
                      child: Image.network(
                      widget.image
                  ),
                    ),
                  Container(
                    child: Text(widget.name),
                  )
                  ],
                ),
              ),

Expanded(child: Align(
                      alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 ElevatedButton(onPressed: (){



                  
                    // Navigator.push(context,MaterialPageRoute(builder: (context) =>  cartpage()),);
                        },
                         child: Text("Add To Cart"),
                         
                        ),
                  SizedBox( width: 20,),
                  Padding(
                    
                    padding: const EdgeInsets.all(20.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(  
                           height: 30.0,
                               width: 30.0,     
                          child: FloatingActionButton(
                            hoverColor: Color.fromARGB(255, 255, 22, 1),
                  heroTag: 'minus',
                  onPressed: minus,
                  child: const Icon(
                    Icons.remove,
                    size: 20,
                  ),),
                        ),
                        SizedBox(width:20),
                        ElevatedButton(onPressed: (){
                          
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>  cartpage()),);
                        },
                        
                         child: Text("$_n",),
                        
                        
                        ),
                       SizedBox(width:20),
                        Container(
                          height: 30.0,
                          width: 30.0,
                          child: FloatingActionButton(
                              hoverColor: Color.fromARGB(255, 2, 249, 60),
                  heroTag: 'add',
                  onPressed: add,
                  child: const Icon(
                    Icons.add,
                    size: 20,
                  ),),
                        ),


            
                      ],
                    ),
                  ),
                ],
              ),
              ),
              )

            ],
          ),
        ),
      ),

    );
   
  }
}



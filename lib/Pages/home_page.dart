import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
  
  }
  
  class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Admin'),
        ),
    body: 
        Container(
                  padding: EdgeInsets.all(8),
                  child: GridView(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                    children: <Widget>[
                       GridView.count(
                      crossAxisCount: 2,
                      children: <Widget> [
                        
                        Card(
                          margin: EdgeInsets.all(10.0),
                          color: Colors.grey[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Menu', 
                              style: TextStyle(
                                color: Colors.grey[850], 
                                fontSize: 18, 
                                fontWeight: FontWeight.bold,
                                )
                              ),
                              GestureDetector(
                                child: new Image.asset('assets/fast-food.png', height: 60, width: 60,),
                                onTap: (){
                                  Navigator.pushNamed(context, '/...');
                                },
                                ),
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.all(10.0),
                          color: Colors.grey[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Data Karyawan', 
                              style: TextStyle(
                                color: Colors.grey[850], 
                                fontSize: 18, 
                                fontWeight: FontWeight.bold,
                                )
                              ),
                              GestureDetector(
                                child: new Image.asset('assets/team.png', height: 60, width: 60),
                                onTap: (){
                                  Navigator.pushNamed(context, '/...',);
                                },
                                ),
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.all(10.0),
                          color: Colors.grey[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Laporan Harian', 
                              style: TextStyle(
                                color: Colors.grey[850], 
                                fontSize: 18, 
                                fontWeight: FontWeight.bold,
                                )
                              ),
                                     GestureDetector(
                                child: new Image.asset('assets/data.jpg', height: 60, width: 60),
                                onTap: (){
                                  Navigator.pushNamed(context, '/...',);
                                },
                                ),
                            ],
                          ),
                        ),

                        Card(
                          margin: EdgeInsets.all(10.0),
                          color: Colors.grey[200],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('About', 
                              style: TextStyle(
                                color: Colors.grey[850], 
                                fontSize: 18, 
                                fontWeight: FontWeight.bold,
                                )
                              ),
                                     GestureDetector(
                                child: new Image.asset('assets/information.png', height: 60, width: 60),
                                onTap: (){
                                  Navigator.pushNamed(context, '/...',);
                                },
                                ),
                            ],
                          ),
                        ),
                      ]
                    ),
                    ],
                  ),
            ),
    );
  }
}
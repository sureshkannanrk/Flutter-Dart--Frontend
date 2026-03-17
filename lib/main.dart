import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: start_page()));
}

class start_page extends StatelessWidget {
  const start_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height/2,
          color: Colors.red,
          
          child: Center(
            child: MaterialButton(shape: CircleBorder(),
            minWidth: 150,
            height: 150,
            color: const Color.fromARGB(255, 96, 172, 99),
            onPressed: ()
            {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>game_page()));
            },
            child: Text('START',style: TextStyle(
              fontSize: 25,
            ),),
            
            ),
          ),
          ),
          Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height/2,
          color: Colors.blue,
          
          child: Center(
            child: MaterialButton(shape: CircleBorder(),
            minWidth: 150,
            height: 150,
            color: const Color.fromARGB(255, 96, 172, 99),
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>game_page()));
            },
            child: Text('START',style: TextStyle(
              fontSize: 25,
            ),),
            
            ),
          ),
          ),
          

        
        ]),
    );
  }
}

class game_page extends StatefulWidget{
  const game_page({super.key});

  @override
  State<game_page> createState() => _game_pageState();
}

class _game_pageState extends State<game_page> {
  double bluelen =0;

  double redlen=0;

  int redval=0;
  int blueval=0;

  

  bool flag=false;
 double maxlen=0;
  @override
  Widget build(BuildContext context) {
    
    if(!flag)
    {
      bluelen=MediaQuery.of(context).size.height/2;
      redlen=bluelen=MediaQuery.of(context).size.height/2;
      flag=true;
    }
    return Scaffold(
      
      body: Column(
        children: [
          MaterialButton(
            

            onPressed: ()
            {
              
              
              setState(() {
                bluelen=bluelen-30;
                redlen=redlen+30;
                
                redval+=5;
              });
              
              if(bluelen<110)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>win_page(1,redval)));
              }
              
              
            },
            
            padding: EdgeInsets.zero,
            child: Container(
              
              color: Colors.red,
              width: double.infinity,
              height: redlen,
              alignment: Alignment.topLeft,
              child: Row(
                
                children: [
                  Expanded(child: Container(
                    margin:EdgeInsets.all(30),child: Text('PLAYER A', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),)),),
                  Container(
                    margin:EdgeInsets.all(20),
                    child: Text(redval.toString(), style: TextStyle(
                      fontSize: 18,)),
                  ),
                ],
              ),
            ),
          ),


          MaterialButton(

            onPressed: ()
            {
              if(redlen<110)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>win_page(3,blueval)));
              }
              
              setState(() {
                redlen=redlen-30;
                bluelen=bluelen+30;
                blueval+=5;
              });

              
              
            },
            padding: EdgeInsets.zero,
            child: Container(
              
              color: Colors.blue,
              width: double.infinity,
              height: bluelen,
              alignment: Alignment.bottomLeft,
              child: Row(
                
                
                children: [
                  Expanded(child: Container(margin:EdgeInsets.all(30),child: Text('PLAYER B', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),)),),
                  Container(
                    margin:EdgeInsets.all(20),
                    child: Text(blueval.toString(), style: TextStyle(
                      fontSize: 18,)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}




class win_page extends StatelessWidget{
  int clr=1;
  int sc=0;
  win_page(this.clr,this.sc);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(126, 95, 88, 88),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: clr==1?Colors.red:Colors.blue,
              ),
              width: MediaQuery.of(context).size.width*4/5,
              height: MediaQuery.of(context).size.height/5,
              alignment: Alignment.center,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top:10),
                    child: Text('${sc}',style: TextStyle(
                      color: Colors.yellowAccent,
                      
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                  Text('YOU ARE THE WINNER', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: const Color.fromARGB(255, 200, 200, 12),
                  ),),
                  Text('@color_defines',style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),),
                
                ],
              ),
              
            ),
            MaterialButton(
              color: Colors.white,
              minWidth: 30,
              height: 30,
              child: Text('RESTART'),
              onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>start_page()));
            })
          ],
        ),
      ),
    );
  }
}
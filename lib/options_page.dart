import 'package:flutter/material.dart';
import './wheather_main_page.dart';

class options extends StatelessWidget {
  const options({super.key});

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
                color:const Color.fromARGB(255, 154, 151, 127),
              ),
              width: MediaQuery.of(context).size.width*4/5,
              height: MediaQuery.of(context).size.height/5,
              alignment: Alignment.center,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top:10),
                    
                  ),
                  Text('FEATURE NOT AVAILABLE NOW!!', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),),
                  
                
                ],
              ),
              
            ),
            MaterialButton(
              color:const Color.fromARGB(255, 103, 122, 137),
              minWidth: 30,
              height: 30,
              child: Text('HOME'),
              onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>main_page()));
            })
          ],
        ),
      ),
    );
  }
}
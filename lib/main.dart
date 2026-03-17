import 'package:flutter/material.dart';

void main()
{
  runApp(Mainapp());
}

class Mainapp extends StatefulWidget{

  @override
  State<Mainapp> createState() => _MainappState();
}

class _MainappState extends State<Mainapp> {


  TextEditingController texteditor = TextEditingController();

  String data ="no data";

  List<String> list1=[];

 @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
      appBar: AppBar(title: Text('ToDo List App'),
      backgroundColor: Colors.blue,
      centerTitle: false,),

      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                controller: texteditor,
                decoration: InputDecoration(
                  label: Text('enter a task'),
                  border: OutlineInputBorder(),
                ),
                            ),
                          ),
              ),

          MaterialButton( child: Text('click', style: TextStyle(fontSize: 18),),
          height: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.white,
            onPressed: (){
              setState(() {
                list1.add(texteditor.text);
                texteditor.clear();
              });
            },
          
          )
            ],
          ),
          

          Flexible(
            child: ListView.builder(
              itemCount: list1.length,
              itemBuilder: (context, index){
                return Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(list1[index]),
                  ),
                ),
                MaterialButton(
                  child: Icon(Icons.delete, color: Colors.red,),
                onPressed: (){
                 setState(() {
                    list1.removeAt(index);
                 });
                } )
              ],
            );
              },
            ),
          )
        ],
      ),
    ),
    );
  }
}
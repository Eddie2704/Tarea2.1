import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: Center(
      child:ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(40)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("WELCOME TO",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500)),
                Text("REMINDERS",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w500)),
                Padding(padding: EdgeInsets.all(40))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.add_alarm_sharp, color: Colors.green,size: 40,),
                    Padding(padding: EdgeInsets.all(3)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      Text("Quick Creation ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                      Text("Simply type in your list, ask siri or add a ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300)),
                      Text("reminder from your Calendar app",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300)),
                      
                      
                    ],
                    ),
                    
                  ],
                ),
                
              ],
        
            ),
            Padding(padding: EdgeInsets.all(15)),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.store_rounded, color: Colors.orange[700],size: 40,),
                    Padding(padding: EdgeInsets.all(3)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Grocery Shopping ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                      Text("Create a Grocery List that automatically ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300)),
                      Text("sorts items you add by category",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300))
                    ],
                    )
                  ],
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.people, color: Colors.yellow[700],size: 40,),
                    Padding(padding: EdgeInsets.all(3)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Easy Sharing",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                      Text("Collaborate on a list, and even assign  ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300)),
                      Text("individual tasks",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300))
                    ],
                    )
                  ],
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.grid_view_outlined, color: Colors.blueAccent[400],size: 40,),
                    Padding(padding: EdgeInsets.all(3)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,        
                    children: [
                      Text("Powerful Organization",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                      Text("Create a new lists to match your needs, ",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300)),
                      Text("categorize reminders with tags, and",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300)),
                      Text("manage reminders around your work",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300)),
                      Text("flow with Smart List",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300))
                    ],
                    )
                  ],
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(70)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
            width: 310,
            child: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Text("Continue",style: TextStyle(color: Colors.white),),
            onPressed: (){}),
          )
              ],
            )
          ], 
        ),
      ]),
    ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:krushisevak/widgets/drop_down_btn.dart';
import 'package:krushisevak/widgets/multi_btn.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Container(alignment: Alignment.center,
          child: const Text('Home Store',style: TextStyle(fontWeight: FontWeight.bold,),),),
        actions: [
          IconButton(onPressed: () {},icon: Icon(Icons.logout),)
        ],
      ),
      body: Column(children: [
        SizedBox(height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Chip(label: Text("category")),
            );
          }),),
          Row(
            children: [
              Flexible(child: DropDownBtn(items: ['high to low','low to high'], selectedItemText: "sort", onSelected: (selected){})  ),
              Flexible(child: MultiBtn()) ,
            ],
          )
      ],),
    );
  }
}
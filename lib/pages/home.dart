// ignore_for_file: prefer_const_constructors
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:learningdart/pages/habit.dart';
import 'package:learningdart/pages/notes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter/services.dart';                    // take json
import 'dart:convert';                                     //json decode encode
import 'package:learningdart/models/catalog.dart';

import '../widgets/drawer.dart';
import 'dolist.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{                                           // Extracting json file
    //await Future.delayed(Duration(seconds: 2));
    var catalogJson =await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["sections"];               //Only products required
    CatalogModels.items = List.from(productsData)
      .map<Item>((item) => Item.fromMap(item))
      .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
      //String appName = "organizer";
      //final dummylist = List.generate(20, (index) => CatalogModels.items[0]);

    return Scaffold(                                  //Velocity X
      appBar: AppBar(
        backgroundColor: Colors.transparent,                                                        
      ),
      drawer: AppDrawer(                              //creates menu button  
      ),
                             
      backgroundColor: context.cardColor,
      //floating button
      

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatalogModels.items.isNotEmpty)          
                CatalogList().expand()          
              else
                Center(child: CircularProgressIndicator(),)             
            ],
          ),
        ),
      ),                                 
    
      );
  }
}


class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      "Task Master".text.xl5.color(context.primaryColor).make(),              // same as Text() but easy to use
      "One stop for all your daily tasks".text.xl.make()             
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModels.items.length,
      itemBuilder: (context, index){
        final catalog = CatalogModels.items[index];
        // If else for diff pages
        if (catalog.id.toString()=="1"){
            return InkWell(    
              onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => NotesPage(),)
                ),
              child: CatalogItem(catalog: catalog)
            );
          }
          if (catalog.id.toString()=="2"){
            return InkWell(    
              onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HabitPage(),)
                ),
              child: CatalogItem(catalog: catalog)
            );
          }
    

          if (catalog.id.toString()=="3"){
            return InkWell(    
              onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => DoListPage(),)
                ),
              child: CatalogItem(catalog: catalog)
            );
          }
        
      },
      ).py12();
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});@override
  Widget build(BuildContext context) {
    return VxBox(                                 //same as container but easy
      
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),                //tag on both sides
            child: Container(
              child: Image.asset(catalog.img)              //prod image
              .box.p12.roundedSM.color(context.cardColor).make().p16().w32(context),
            ),
          ),

          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              catalog.name.text.xl
              .textStyle(context.captionStyle)
              .bold.color(context.theme.hintColor).make(),     //prod name
              catalog.desc.text.make().py8(),                         //prod description
              
              
              ]
            )
          )
        ],
      )
      ).color(context.canvasColor).roundedSM.square(150).make().py16();
  }
}

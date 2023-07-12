import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:learningdart/utils/note_tile.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/form_buttons.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  final notebox = Hive.box("Notes_db");
  //Database db = HabitDatabase();

  List<Map<String, dynamic>> _items=[];

  final nameController=TextEditingController();
  final textController=TextEditingController();

   void initState() {
    // TODO: implement initState
    super.initState();
    refreshItems();
  }

  void refreshItems(){
    final data=notebox.keys.map((key){
      final item=notebox.get(key);
      return {"key": key, "name":item["name"],"text":item["text"]};
    }).toList();

    setState(() {
      _items=data.reversed.toList();
      print(_items.length);
    });
  }

  Future<void> saveNewNote(Map<String, dynamic> newItem) async{
     
    notebox.add(newItem);
    refreshItems();
    Navigator.of(context, rootNavigator: true).pop(context);
  }



  //create new task 
  void createNewNote(BuildContext ctx,int? itemkey) async{
    
    showDialog(
      
      context: context,
       builder: ((context) {
              
        //Dialog Box   
         return AlertDialog(
          //callback text
         
          backgroundColor: context.cardColor,
          content: SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [             
                const Text("They hating. But they taking notes",style: TextStyle(fontSize: 16),),
                //input
                TextField(
                  style: TextStyle(color: context.primaryColor),
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "Note's title", hintStyle: TextStyle(color: Colors.grey )
                  ),
                   maxLength: 20,
                ),
                 TextField(
                  style: TextStyle(color: context.primaryColor),
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: "Note's body", hintStyle: TextStyle(color: Colors.grey )
                  ),
                  minLines: 1,
                  maxLines: 5,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //save button
                  children: [
                    MyButton(text: "Save", onPressed: () async{
                      saveNewNote({
                        "name": nameController.text,
                        "text": textController.text,
                      });
                    }),

                    const SizedBox(width: 8),
                    MyButton(text: "Cancel", onPressed: () => Navigator.pop(context),)
                  ],
                )
              ],
            ),
          ),
         );
       })
    );
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: context.cardColor,
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Notes List".text.xl2.color(context.primaryColor).make(),                                                        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> createNewNote(context,null),
        backgroundColor: context.theme.hintColor,
        child: const Icon(CupertinoIcons.plus,color: Colors.white,),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                child: ListView(
                   children:  [

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final currentItem=_items[index];
                        
                        return NoteTile(
                          title: currentItem['name'], 
                          para: currentItem['text'],
                        );
                      },
                    ),

                       
                   ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
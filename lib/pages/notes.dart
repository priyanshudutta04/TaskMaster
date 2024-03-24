
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:velocity_x/velocity_x.dart';

import '../db/db.dart';
import '../utils/form_buttons.dart';
import '../widgets/notes_colors.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  final notebox = Hive.box("Notes_db");
  NoteDatabase db = NoteDatabase();



  final nameController=TextEditingController();
  final bodyController=TextEditingController();

  @override
   void initState() {

    if(notebox.get("NOTELIST")==null){
      db.createInitialNote();
    }
    else{
      db.loadNote();
    }
    // TODO: implement initState
    super.initState();
  }


  void saveNewNote(){
    setState(() {
      db.notesList.add([nameController.text,bodyController.text]);
      nameController.clear();
      bodyController.clear();
    });
    Navigator.of(context, rootNavigator: true).pop(context);
    db.updateNote();
  }

  //delete task
  void deleteNote(int index){
    setState(() {
      db.notesList.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Note Deleted"))
    );
    db.updateNote();
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
                const Text("Start taking notes.",style: TextStyle(fontSize: 16),),
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
                  controller: bodyController,
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
                    MyButton(text: "Save", onPressed: saveNewNote),
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
    db.updateNote();
  }

   randomColor(){
    Random random=Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
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
                child: db.notesList.length==0? 
                  Center(
                    child:Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Column(
                        children: [
                          Text("No Notes Present",style: TextStyle(fontSize: 20,color: context.theme.primaryColor),),
                          SizedBox(height: 20,),
                          Text("Tap on '+' to create your first note"),
                        ],
                      ),
                    ),
                  )
                     
                :ListView(
                   children:  [                                     
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: db.notesList.length,
                      itemBuilder: (context, index) {

                        return Padding(
                          padding:  EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            decoration: BoxDecoration(
                              color: randomColor(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:  Row(                        
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                const SizedBox(width: 8,),
                                
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,              
                                    children: [
                                      Text(db.notesList[index][0],
                                      style:  TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      Text(db.notesList[index][1],style:  TextStyle(
                                        color: context.primaryColor
                                        ),),
                                      const SizedBox(height: 10,),
                                    ]
                                  ),
                                ),

                                const SizedBox(width: 10,),

                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    onPressed: ()=>deleteNote(index), 
                                    icon: Icon(Icons.delete),
                                    color: context.theme.unselectedWidgetColor,
                                  ),                   
                                )

                              ]
                            ),
                          ),
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
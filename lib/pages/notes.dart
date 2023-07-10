import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/utils/note_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: context.cardColor,
      
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Notes List".text.xl2.color(context.primaryColor).make(),                                                        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
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
                   children: const [

                      NoteTile(title: "First Note", para: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis lectus in magna hendrerit sagittis. Integer sed libero nulla. Integer faucibus lacus sit amet euismod.",),

                      NoteTile(title: "Second Note", para: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis lectus in magna hendrerit sagittis. Integer sed libero nulla. Integer faucibus lacus sit amet euismod.",),

                      NoteTile(title: "Third Note", para: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis lectus in magna hendrerit sagittis. Integer sed libero nulla. Integer faucibus lacus sit amet euismod.",),

                      NoteTile(title: "Fourth Note", para: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis lectus in magna hendrerit sagittis. Integer sed libero nulla. Integer faucibus lacus sit amet euismod.",),
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
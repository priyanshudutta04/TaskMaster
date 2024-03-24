import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/notes_colors.dart';

// ignore: must_be_immutable
class NoteTile extends StatelessWidget {
   NoteTile({
    super.key,
    required this.para,
    required this.title,
    required this.deleteFunction,
  });

  final String title;
  final String para;

  Function(BuildContext)? deleteFunction;


  randomColor(){

    Random random=Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  @override
  Widget build(BuildContext context) {
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
          SizedBox(width: 8,),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,              
              children: [
                Text(title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 10,),
                Text(para),
                SizedBox(height: 10,),
              ]
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: ()=>deleteFunction, 
              icon: Icon(Icons.delete)
            ),     
          )
        ]
      ),
    ),
  );
  }
}
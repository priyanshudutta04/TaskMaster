import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/colors.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    super.key,
    required this.para,
    required this.title
  });

  final String title;
  final String para;

  randomColor(){
    Random random=Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }


  @override
  Widget build(BuildContext context) {
    return                     Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        decoration: BoxDecoration(
                          color: randomColor(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Row(                        
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 8,),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,              
                                children: [
                                  Text("First Note",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis hendrerit euismod enim, nec tincidunt erat. Duis nec nunc massa."),
                                  SizedBox(height: 10,),
                                ]
                              ),
                            ),
                           SizedBox(width: 10,),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                onPressed: null, 
                                icon: Icon(Icons.delete)
                                ),
                            )
                          ]
                        ),
                      ),
                    );
  }
}
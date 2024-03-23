// ignore_for_file: prefer_const_constructors
//ignore_for_file: prefer_const_literals

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';

class AppDrawer extends StatelessWidget {

  const AppDrawer({super.key});
  
  get catalog => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(  
        color: context.cardColor,
        child: ListView(
          children:  [
            SizedBox(height: 20,),
            ListTile(
              leading: CircleAvatar(
                radius: 40,

                backgroundColor: context.theme.canvasColor,
                child: Icon(
                  Icons.person,
                  color: context.theme.hintColor,
                  size: 30,
                ),
              ),
        
              title: Text(
                "User",style: 
                TextStyle(color: context.theme.hintColor,fontSize: 22),
              ),
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(                                                                         
                leading: Icon(CupertinoIcons.home, color: context.theme.hintColor,),   
                title: Text("Home", textScaler: TextScaler.linear(1.2),),    
              ),
            ),
           
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: ListTile(                                                                     
               leading: Icon(CupertinoIcons.gear, color: context.theme.hintColor,),        
                title: Text("Settings", textScaler: TextScaler.linear(1.2),),
                onTap: () {
                  Navigator.pushNamed(context, Myroutes.settingsRoute);
                },
                   
                           ),
             )

          ],    
        ),
      ),
    );
  }
}
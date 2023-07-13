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
            DrawerHeader(
              
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("User", style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold
                  ),),
                accountEmail: Text("usermail@gmail.com", style: TextStyle(color: Colors.white),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/user_image2.jpg"),
                ),
              ),
            ),

            ListTile(                                                                         
              leading: Icon(CupertinoIcons.home, color: context.theme.hintColor,),   
              title: Text("Home", textScaleFactor: 1.3,),    
            ),
           
             ListTile(                                                                     
             leading: Icon(CupertinoIcons.gear, color: context.theme.hintColor,),        
              title: Text("Settings", textScaleFactor: 1.3,),
              onTap: () {
                Navigator.pushNamed(context, Myroutes.settingsRoute);
              },
                 
            )

          ],    
        ),
      ),
    );
  }
}
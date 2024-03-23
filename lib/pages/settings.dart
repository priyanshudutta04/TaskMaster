// ignore_for_file: prefer_const_constructors
// ignore_for_file: sort_child_properties_last

//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learningdart/widgets/change_theme.dart';

//import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';

import '../main.dart';


//import '../models/catalog.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

bool isSwitched = false;
IconData iconlight = Icons.wb_sunny;
IconData icondark = Icons.nights_stay;

class _SettingsPageState extends State<SettingsPage> {

  

  //void themeCheckSettings()
  //async{
    //SharedPreferences sp = await SharedPreferences.getInstance();
    //isSwitched=sp.getBool("theme")!;
 // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        title: "Setings".text.xl2.color(context.primaryColor).make(),
      ),
      backgroundColor: context.cardColor,
      body: SafeArea(
        child: Container(
          child: ListView(
           children:  [
            //Mode Switch      
            VxBox(
                child: ListTile(
              leading: Icon(
                CupertinoIcons.moon_stars_fill,
                color: context.primaryColor,
              ).py16(),
              title: "Dark Mode".text.xl2.make().py16().px16(),
              trailing: ChangeThemeButtonWidget(),
            )).color(context.canvasColor).roundedLg.square(70).make().py12(),

              //Reach us
              VxBox(                  
                child:  ListTile(
                  leading: Icon(CupertinoIcons.mail_solid, color: context.primaryColor,).py16(),
                  title: "Contact Developer".text.xl2.make().py16().px16(),     
                 ),            
              ).color(context.canvasColor).roundedLg.square(70).make().py12(),

              //Terms And Conditions
              VxBox(                  
                child:  ListTile(
                  leading: Icon(CupertinoIcons.doc_text_fill, color: context.primaryColor,).py16(),
                  title: "Terms And Conditions".text.xl2.make().py16().px16(),     
                 ),            
              ).color(context.canvasColor).roundedLg.square(70).make().py12(),

              //Privacy Policy
              VxBox(                  
                child:  ListTile(
                  leading: Icon(CupertinoIcons.doc_on_doc_fill, color: context.primaryColor,).py16(),
                  title: "Privacy Policy".text.xl2.make().py16().px16(),     
                 ),            
              ).color(context.canvasColor).roundedLg.square(70).make().py12(),
          ],
        )
      ).py32(),
    ),
    );
  }
}




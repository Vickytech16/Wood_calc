

import 'package:flutter/material.dart';
import 'main.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: Colors.brown[300],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.brown[100],
        child: Center(child: Text("Hey, I am Vignesh, an Aspiring Software Developer. If you like my work, and you want more apps like this, reach me out at seb.castellanos2003@gmail.com or contact me at 6379805837")),
      ),


    );
  }
}
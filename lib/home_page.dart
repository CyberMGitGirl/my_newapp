import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MediCaller"),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          ),
        ]
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search Hospital or Address",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12)

                ),
                fillColor: Colors.grey.shade200,
                filled: true,
              ),
            ),
          ),
          //Widget for showing image
        Image.asset(
          "assets/mapblur.jpg",
          //width: MediaQuery.sizeOf(context).width,
          //height: MediaQuery.sizeOf(context).height * 0.6,
        
          
          ),

      ],
      )

    );
  }
}
import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// Variable :
  String motSaisi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer : va permettre de mettre un menu dans l'application
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: Column(
                    children: const [
                      Text("Menu",
                          style: TextStyle(
                              fontFamily: "Pacifico",
                              fontSize: 20,
                              color: Colors.white)),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                            backgroundImage: AssetImage("images/abc.png")),
                      )
                    ],
                  )),
              // On définit une tuile qui va être un onglet du menu
              ListTile(
                title: Row(
                  children: const [
                    Icon(
                      Icons.abc_outlined,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Analysez",
                        style: TextStyle(fontFamily: "Pacifico"),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.book_outlined, color: Colors.black),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Historique",
                        style: TextStyle(fontFamily: "Pacifico"),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(
                      Icons.info_outline_rounded,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "A propos",
                        style: TextStyle(fontFamily: "Pacifico"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Analyseur"),
        ),
        body:
            // const Center(
            //     child: Text(
            //   "Je vais analysez un mot",
            //   style: TextStyle(
            //       fontFamily: 'Pacifico', fontSize: 20.0, color: Colors.red),
            // )),
            Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                // configuration du l'apparence
                style: const TextStyle(fontFamily: 'Pacifico'),
                decoration: InputDecoration(
                    // hint text _ équivaux a placehorder
                    hintText: 'Entrez votre mot à analysez',
                    // border pour spécifier la bordure de notre champs de saisie
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                // configuration du comportement
                onChanged: (newValue) {
                  setState(() {
                    motSaisi = newValue;
                  });
                },
              ),
            ),
            //on veut afficher le text que si quelque chose a été saisi
            motSaisi.isNotEmpty
                ? Text(
                    "Vous voulez analysez : $motSaisi ?",
                    style: const TextStyle(fontFamily: 'Pacifico'),
                  )
                : const Text("")
          ],
        ));
  }
}

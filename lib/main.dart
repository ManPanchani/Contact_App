import 'dart:io';

import 'package:flutter/material.dart';

import 'Add_Page.dart';
import 'Call_info.dart';
import 'Splash_Page.dart';
import 'gollbal.dart';

void main() {
  runApp(
    const HomePage(),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash_Page(),
        'All_Contact': (context) => const All_Contact(),
        'Add_Contact': (context) => const Add_Contact(),
      },
    );
  }
}

class All_Contact extends StatefulWidget {
  const All_Contact({Key? key}) : super(key: key);

  @override
  All_ContactState createState() => All_ContactState();
}

class All_ContactState extends State<All_Contact> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: (Global.Mytheme) ? Brightness.dark : Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Contacts",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            Switch(
                onChanged: (val) {
                  setState(() {
                    Global.Mytheme = !Global.Mytheme;
                  });
                },
                value: Global.Mytheme),
            const Image(
              image: AssetImage(
                "images/menu.png",
              ),
              width: 30,
            ),
          ],
        ),
        body: (Global.allcontacts.isEmpty)
            ? Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        "images/box.png",
                      ),
                      height: 150,
                      color: (Global.Mytheme) ? Colors.white : Colors.black,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "You Have No Contacts Yet",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: Global.allcontacts.length,
                itemBuilder: (context, c1) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (contaxt) => Call_info(
                            c: Global.allcontacts[c1],
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: (Global.allcontacts[c1].Image != null)
                          ? FileImage(Global.allcontacts[c1].Image as File)
                          : null,
                    ),
                    title: Text(
                      "${Global.allcontacts[c1].Firstname} ${Global.allcontacts[c1].Lastname}",
                    ),
                    subtitle: Text(
                      "+91 ${Global.allcontacts[c1].Phonenumber} ",
                    ),
                    trailing: const Image(
                      image: AssetImage(
                        "images/calling.png",
                      ),
                      height: 35,
                      color: Colors.green,
                    ),
                  );
                },
              ),
        floatingActionButton: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed("Add_Contact");
          },
          child: const Text(
            "+",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:contacts_app/gollbal.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class Add_Contact extends StatefulWidget {
  const Add_Contact({Key? key}) : super(key: key);

  @override
  State<Add_Contact> createState() => Add_ContactState();
}

class Add_ContactState extends State<Add_Contact> {
  final ImagePicker _picker = ImagePicker();

  GlobalKey<FormState> contactkey = GlobalKey<FormState>();

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  String? firstname;
  String? lastname;
  String? phonenumber;
  String? email;
  File? image;

  late int n;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: (Global.Mytheme) ? Brightness.dark : Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Edit Contact",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                if (contactkey.currentState!.validate()) {
                  contactkey.currentState!.save();

                  Contact c1 = Contact(
                    Firstname: firstname,
                    Lastname: lastname,
                    Phonenumber: phonenumber,
                    Email: email,
                    Image: image,
                  );

                  setState(() {
                    Global.allcontacts.add(c1);
                  });

                  Navigator.of(context).pushNamed('All_Contact', arguments: c1);
                }
              },
              child: Image(
                image: AssetImage(
                  "images/done.png",
                ),
                color: (Global.Mytheme) ? Colors.white : Colors.black,
                width: 60,
              ),
            ),
          ],
          leading: Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              child: Text(
                "<",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          toolbarHeight: 70,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: (image != null) ? FileImage(image!) : null,
                  backgroundColor: Colors.grey,
                  radius: 50,
                  child: Text(
                    (image != null) ? "" : "ADD",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        XFile? pickedFile =
                            await _picker.pickImage(source: ImageSource.camera);
                        setState(() {
                          image = File(pickedFile!.path);
                        });
                      },
                      child: Text(
                        "CAMERA",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        XFile? pickedPhoto = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          image = File(pickedPhoto!.path);
                        });
                      },
                      child: const Text(
                        "ALBUMS",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                Form(
                  key: contactkey,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "First Name",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            controller: firstnamecontroller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter Your First Name...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                firstname = val;
                              });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                              hintText: "First Name",
                              hintStyle: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Last Name",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            controller: lastnamecontroller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter Your Last Name...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                lastname = val;
                              });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                              hintText: "Last Name",
                              hintStyle: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Phone Number",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.phone,
                            controller: phonenumbercontroller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter Your Number...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                phonenumber = val;
                              });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                              hintText: "+91 90900 10100",
                              hintStyle: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            controller: emailcontroller,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter Your Email..";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

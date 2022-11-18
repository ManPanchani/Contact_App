import 'dart:io';

import 'package:flutter/material.dart';

class Global {
  static bool Mytheme = false;
  static late File Images;
  static late String Fisrt_Name;
  static late String Last_Name;
  static late int Phone_Number;
  static dynamic Email;

  static List<Contact> allcontacts = [];
}

class Contact {
  late String? Firstname;
  late String? Lastname;
  late String? Phonenumber;
  late String? Email;
  late File? Image;

  Contact({
    required this.Firstname,
    required this.Lastname,
    required this.Phonenumber,
    required this.Email,
    required this.Image,
  });
}

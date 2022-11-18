import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import 'gollbal.dart';

class Call_info extends StatefulWidget {
  Contact c;
  Call_info({Key? key, required this.c}) : super(key: key);

  @override
  State<Call_info> createState() => Call_infoState();
}

class Call_infoState extends State<Call_info> {
  Future<void> makeCall(String number) async {
    Uri call = Uri(scheme: 'tel', path: "+91 ${number}");
    print(number);
    await launchUrl(call);
  }

  Future<void> sendSMS(String number) async {
    Uri sms = Uri(scheme: 'sms', path: "${number}");
    await launchUrl(sms);
  }

  Future<void> sendEmail(String email) async {
    Uri mail = Uri(
      scheme: 'mailto',
      path: "${email}",
      query: "",
    );
    await launchUrl(mail);
  }

  _callNumber(String number) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    // Contact res = ModalRoute.of(context)!.settings.arguments as Contact;
    return MaterialApp(
      theme: ThemeData(
        brightness: (Global.Mytheme) ? Brightness.dark : Brightness.light,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Contacts",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
          leading: Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "<",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 1,
            ),
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: (widget.c.Image != null)
                    ? FileImage(widget.c.Image!)
                    : null,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "${widget.c.Firstname} ${widget.c.Lastname}",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "+91 ${widget.c.Phonenumber} ",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
              indent: 20,
              endIndent: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      makeCall(widget.c.Phonenumber!);
                    });
                  },
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: Image(
                      image: AssetImage(
                        "images/calling.png",
                      ),
                      height: 35,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      sendSMS(widget.c.Phonenumber!);
                    });
                  },
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.amber,
                    child: Image(
                      image: AssetImage(
                        "images/text message.png",
                      ),
                      height: 35,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      sendEmail(widget.c.Email!);
                    });
                  },
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Image(
                      image: AssetImage(
                        "images/email.png",
                      ),
                      height: 35,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() async {
                      await Share.share(
                          "Name: ${widget.c.Firstname} ${widget.c.Lastname}\n+91 ${widget.c.Phonenumber}");
                    });
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.amber.shade700,
                    child: const Image(
                      image: AssetImage(
                        "images/share icon.png",
                      ),
                      height: 35,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
              indent: 20,
              endIndent: 20,
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }
}

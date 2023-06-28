import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CallsAndMessagesService {
  void call(String number) => launch("tel:$number");
  void sendSms(String number) => launch("sms:$number");
  void sendEmail(String email) => launch("mailto:$email");
}

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardUI(),
    );
  }
}

class CardUI extends StatelessWidget {
  CardUI({Key? key});

  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  final String number = "+91 7602781721";
  final String email = "asif16cse@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/prof.jpg'),
            ),
            SizedBox(height: 15),
            Text(
              'Asif Mandal',
              style: GoogleFonts.dancingScript(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'FLUTTER DEVELOPER',
              style: GoogleFonts.playfairDisplay(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 1,
              width: 180,
              color: Colors.white,
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () => _service.call(number),
              child: Container(
                color: Colors.white,
                height: 45,
                width: 300,
                child: Row(
                  children: [
                    SizedBox(width: 7),
                    Icon(Icons.phone),
                    SizedBox(width: 40),
                    Text(
                      "$number",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () => _service.sendEmail(email),
              child: Container(
                color: Colors.white,
                height: 45,
                width: 300,
                child: Row(
                  children: [
                    SizedBox(width: 7),
                    Icon(Icons.mail),
                    SizedBox(width: 40),
                    Text(
                      "$email",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

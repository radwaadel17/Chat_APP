import 'package:app/firebase_options.dart';
import 'package:app/views/Intro%20view.dart';
import 'package:app/views/chatPage.dart';
import 'package:app/views/sign%20in%20view.dart';
import 'package:app/views/sign%20up%20view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  runApp(const ChatApp());
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      child: MaterialApp(
        routes: {
          'signUp': (context) => signUp(),
          'signIn': (context) => SignIn(),
          'ch' :(context) => ChatPage(),
        },
        debugShowCheckedModeBanner: false,
        home: Inro(),
      ),
    );
  }
}

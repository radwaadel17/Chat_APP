import 'package:app/views/Intro%20view.dart';
import 'package:app/views/sign%20in%20view.dart';
import 'package:app/views/sign%20up%20view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ChatApp());
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
           'signUp' : (context) => signUp() ,
           'signIn' :(context) => SignIn(),
        },
        debugShowCheckedModeBanner: false,
        home: Inro(),
      ),
    );
  }
}

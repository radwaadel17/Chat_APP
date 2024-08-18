import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Inro extends StatelessWidget {
  const Inro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Text('Get Closet to Everyone',
        textAlign: TextAlign.left,
         style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
         ),
        ),
      ),
       Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Text('Helps you to contact everyone with just easy way',
        textAlign: TextAlign.left,
         style: TextStyle(
          //fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.grey.withOpacity(0.8),
         ),
        ),
      ),
      const SizedBox(height: 50,),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: EdgeInsets.only(right: 35),
          child: SizedBox(
            height: 310 ,
            child: Image(image: AssetImage('assets/images/Dayflow Best Friends.png'
            )),
          ),
        ),
      ),
     const SizedBox(height: 50,),
      ElevatedButton(onPressed: (){} ,
       child: Text(
        'Get Started'
       ),
       style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff771F98),
        fixedSize: Size(295, 46),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
       ),
       )
    ],
    )
  );
  }
}
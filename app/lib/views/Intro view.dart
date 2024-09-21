import 'package:app/constants.dart';
import 'package:app/views/sign%20in%20view.dart';
import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
      ElevatedButton(onPressed: (){
       Navigator.pushNamed(context,'signIn');
      } ,
       style: ElevatedButton.styleFrom(
        backgroundColor: KColor,
        fixedSize: const Size(295, 46),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
       ),
       child: const Text(
        'Get Started' ,
        style: TextStyle(
          color: Colors.white,
        ),
       ),
       )
    ],
    )
  );
  }
}
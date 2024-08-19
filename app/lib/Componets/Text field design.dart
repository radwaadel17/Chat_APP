import 'package:flutter/material.dart';

class customTextfield extends StatelessWidget {
  const customTextfield({super.key , required this.txt});
  final String txt ;
  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
       Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 15,
              color: const Color(0xff771F98).withOpacity(0.8),
            ),
          ),
        ),
        //  SizedBox(height: 0.5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TextField(
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                color: Color(0xff771F98),
              ) , borderRadius: BorderRadius.circular(24)),
              hintText: 'Enter $txt' ,
            ),
          ),
        ),
    ],
   );

  }
}
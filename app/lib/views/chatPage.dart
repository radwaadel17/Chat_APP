import 'package:app/widgets/chatBubble.dart';
import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: KColor,
        leading: const Icon(
         Icons.arrow_back,
         color: Colors.white,
        ),
        title: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 80.w),
          child: SizedBox(
            height: 60.h,
            child: const Row(
              children: [
                  Image(image: AssetImage('assets/images/Stuck at Home - Mailing List.png')),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context , index) { 
              return chatBubble();
            }),
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: KColor,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                ),
                suffixIcon: IconButton(onPressed: (){}, icon:  const Icon(Icons.send),
                  color: KColor,)
              ),
           ),
           ),
        ],
      )
    );
  }
}


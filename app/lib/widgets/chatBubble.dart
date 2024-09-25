import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class chatBubble extends StatelessWidget {
  const chatBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 24.w , vertical: 13.h),
          decoration:  BoxDecoration(
            color: KColor,
            borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(30.r) ,
             topEnd: Radius.circular(30.r)  , 
             bottomEnd: Radius.circular(30.r)  , 
            )
          ),
          child: const Text("hiiiii " , style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
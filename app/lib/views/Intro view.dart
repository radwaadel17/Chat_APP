import 'package:app/constants.dart';
import 'package:app/views/sign%20in%20view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Inro extends StatelessWidget {
  const Inro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
    body: Column(
    
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20.h,),
       Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Text('Get Closet to Everyone',
        textAlign: TextAlign.left,
         style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.sp,
         ),
        ),
      ),
       Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Text('Helps you to contact everyone with just easy way',
        textAlign: TextAlign.left,
         style: TextStyle(
          //fontWeight: FontWeight.bold,
          fontSize: 14.sp,
          color: Colors.grey.withOpacity(0.8),
         ),
        ),
      ),
       SizedBox(height: 50.h,),
       Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Padding(
          padding: EdgeInsets.only(right: 35.w),
          child: SizedBox(
            height: 310.h ,
            child: Image(image: AssetImage('assets/images/Dayflow Best Friends.png'
            )),
          ),
        ),
      ),
      SizedBox(height: 30.h,),
      ElevatedButton(onPressed: (){
       Navigator.pushNamed(context,'signIn');
      } ,
       style: ElevatedButton.styleFrom(
        backgroundColor: KColor,
        fixedSize:  Size(295.w, 46.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
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